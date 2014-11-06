require 'httparty'
require 'json'

class FFCurrentMatchup < FantasyQuery

  TEAM_ID_RE = /.*teamId=([0-9]*).*/

  def get_url
    matchups = FFMatchups.new(@league_id).get
    $logger.info "getting matchup for team #{@team_id}"
    game_id = matchups
      .select { |m| m[:team1_id] == @team_id or m[:team2_id] == @team_id }
      .collect { |m| m[:game_id] }
      .first

    if not game_id then
      $logger.error "couldn't find a game for that team. "\
        "I did find these though: #{matchups}"
      nil
    else
      "http://www.fleaflicker.com/nfl/showMatchup.do"\
        "?leagueId=#{@league_id}&fantasyGameId=#{game_id}&statType=0"
    end
  end

  def parse html
    html_doc = Nokogiri::HTML(html)
    table0s = html_doc.xpath('//*[@id="table_0"]')
    scoreboard = table0s[0]
    team1 = table0s[1]
    team2 = html_doc.xpath('//*[@id="table_1"]')[0]
    {
      :team1 => parse_team(0, scoreboard, team1),
      :team2 => parse_team(1, scoreboard, team2)
    }
  end

  def parse_team(team_idx, scoreboard_doc, team_doc)
    row = scoreboard_doc.css("tr")
      .select {|tr| tr["class"] != nil }
      .select {|tr| tr["class"].include? "scoreboard" }[team_idx]
    name_node = row.css("a").select {|a| TEAM_ID_RE.match a["href"]}.first
    {
      :team_id => TEAM_ID_RE.match(name_node["href"])[1],
      :score => row.css("span").last.text.to_f,
      :players => parse_players(team_doc),
      :team_name => name_node.text
    }
  end

  def parse_players(team_doc)
    players = []
    player_docs = find_player_docs(team_doc)
    player_docs.each do |p_doc|
      players << parse_player(p_doc)
    end
    players
  end

  def find_player_docs(team_doc)
    all_players = team_doc.css("tr").select do |tr|
      tr["class"] != nil and tr["class"].include? "cell-row"
    end
    #Get only starters
    all_players.take_while { |tr| tr["class"] == "cell-row" }
  end

  def parse_player(p_doc)
    {
      :name     => name( p_doc ),
      :points   => points( p_doc ),
      :team     => team( p_doc ),
      :position => position( p_doc )
    }
  end

  def name p_doc
    nodes = p_doc.css("a").select { |a| a["href"].include? "playerId"}
    first_text_or_default(nodes, "??")
  end

  def points p_doc
    nodes = p_doc.css("a").select { |a| a["href"].include? "fantasy-points"}
    first_text_or_default(nodes, 0).to_f
  end

  def team p_doc
    nodes = p_doc.css("span").select { |s| s["class"] == "player-team" }
    first_text_or_default(nodes, "??")
  end

  def position p_doc
    nodes = p_doc.css("span").select { |s| s["class"] == "position" }
    first_text_or_default(nodes, "??")
  end

  def first_text_or_default(docs, default)
    if docs.nil? or docs.length == 0
      default
    else
      docs.first.text
    end
  end
end
