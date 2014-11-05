
class FFCurrentMatchup

  @teamIdRe = /.*teamId=([0-9]*).*/
  @scoreRe = /[-]?[0-9]*\.?[0-9]*/

  def self.get
    self.parse nil
  end

  def self.parse html
    html_doc = Nokogiri::HTML(html)
    table0s = html_doc.xpath('//*[@id="table_0"]')
    scoreboard = table0s[0]
    team1 = table0s[1]
    team2 = html_doc.xpath('//*[@id="table_1"]')[0]
    {
      :team1 => self.parse_team(0, scoreboard, team1),
      :team2 => self.parse_team(1, scoreboard, team2),
    }
  end

  def self.parse_team(team_idx, scoreboard_doc, team_doc)
    row = scoreboard_doc.css("tr")
      .select {|tr| tr["class"] != nil }
      .select {|tr| tr["class"].include? "scoreboard" }[team_idx]
    name_node = row.css("a").select {|a| @teamIdRe.match a["href"]}.first
    {
      :team_id => @teamIdRe.match(name_node["href"])[1],
      :score => row.css("span").last.text.to_f,
      :players => self.parse_players(team_doc),
      :team_name => name_node.text
    }
  end

  def self.parse_players(team_doc)
    players = []
    player_docs = team_doc.css("tr")
      .select {|tr| tr["class"] != nil and tr["class"].include? "cell-row" }
      .take_while { |tr| tr["class"] == "cell-row" }
    player_docs.each do |p_doc|
      players << self.parse_player(p_doc)
    end
    players
  end

  def self.parse_player(p_doc)
    {
      :name => p_doc.css("a")
        .select { |a| a["href"].include? "playerId"}.first.text,
      :points => p_doc.css("a")
        .select { |a| a["href"].include? "fantasy-points"}.first.text.to_f,
      :team => p_doc.css("span")
        .select { |s| s["class"] == "player-team" }.first.text,
      :position => p_doc.css("span")
        .select { |s| s["class"] == "position" }.first.text
    }
  end
end
