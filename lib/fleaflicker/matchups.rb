require 'nokogiri'

class FFMatchups < FantasyQuery

  TEAM_ID_RE = /.*teamId=([0-9]*).*/
  GAME_ID_RE = /.*fantasyGameId=([0-9]*).*/

  def get_url
    "http://www.fleaflicker.com/nfl/league-schedule?leagueId=#{@league_id}"
  end

  def parse html
    html_doc = Nokogiri::HTML(html)
    cells = html_doc.xpath("//tr[contains(concat(' ',normalize-space(@class),' '),' cell-row ')]")
    i = 0
    games = []
    until i >= cells.length  do
      team_1 = cells[i].css("a")
        .select {|a| TEAM_ID_RE.match a["href"]}
        .collect {|a| TEAM_ID_RE.match(a["href"])[1]}.first
      team_2 = cells[i + 1].css("a")
        .select {|a| TEAM_ID_RE.match a["href"]}
        .collect {|a| TEAM_ID_RE.match(a["href"])[1]}.first
      game = cells[i + 2].css("a")
        .select {|a| GAME_ID_RE.match a["href"]}
        .collect {|a| GAME_ID_RE.match(a["href"])[1]}.first

      games << {
        :team1_id => team_1,
        :team2_id => team_2,
        :game_id => game
      }
      i = i + 3
    end
    games
  end
end
