require 'nokogiri'

class FFMatchups

  @teamIdRe = /.*teamId=([0-9]*).*/
  @gameIdRe = /.*fantasyGameId=([0-9]*).*/

  def self.get
    self.parse nil
  end

  def self.parse html
    html_doc = Nokogiri::HTML(html)
    cells = html_doc.xpath("//tr[contains(concat(' ',normalize-space(@class),' '),' cell-row ')]")
    i = 0
    games = []
    until i >= cells.length  do
      team_1 = cells[i].css("a")
        .select {|a| @teamIdRe.match a["href"]}
        .collect {|a| @teamIdRe.match(a["href"])[1]}.first
      team_2 = cells[i + 1].css("a")
        .select {|a| @teamIdRe.match a["href"]}
        .collect {|a| @teamIdRe.match(a["href"])[1]}.first
      game = cells[i + 2].css("a")
        .select {|a| @gameIdRe.match a["href"]}
        .collect {|a| @gameIdRe.match(a["href"])[1]}.first

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
