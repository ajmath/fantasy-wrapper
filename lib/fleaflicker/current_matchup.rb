
class FFCurrentMatchup
  def self.get
    self.parse nil
  end

  def self.parse html
    {
      :team1 => {
        :team_id => "1095147",
        :team_name => "Something about your mom",
        :score => 138.34,
        :players => [ {
          :name => "P. Manning",
          :position => "QB",
          :team => "DEN",
          :points => 29.44
        }, {
          :name => "B. Brown",
          :position => "RB",
          :team => "BUF",
          :points => 1.5
        }, {
          :name => "E. Lacy",
          :position => "RB",
          :team => "GB",
          :points => 18.2
        }, {
          :name => "G. Tate",
          :position => "WR",
          :team => "DET",
          :points => 21.1
        }, {
          :name => "T. Hilton",
          :position => "WR",
          :team => "IND",
          :points => 21.5
        }, {
          :name => "D. Baldwin",
          :position => "WR/RB/TE",
          :team => "SEA",
          :points => 6.1
        }, {
          :name => "M. Bennett",
          :position => "TE",
          :team => "CHI",
          :points => 15.5
        }, {
          :name => "B. Walsh",
          :position => "K",
          :team => "MIN",
          :points => 8
        }, {
          :name => "Browns",
          :position => "TM",
          :team => "CLE",
          :points => 17
        }]
      },
      :team2 => {
        :team_id => "1121906",
        :team_name => "Hemingway squandered half his life hanging around Picasso, trying to nail his leftovers",
        :score => 150.46,
        :players => [ {
          :name => "C. Palmer",
          :position => "QB",
          :team => "ARI",
          :points => 25.16
        }, {
          :name => "S. Jackson",
          :position => "RB",
          :team => "ATL",
          :points => 12
        }, {
          :name => "D. Murray",
          :position => "RB",
          :team => "DAL",
          :points => 20.1
        }, {
          :name => "A. Jeffery",
          :position => "WR",
          :team => "CHI",
          :points => 11.9
        }, {
          :name => "S. Watkins",
          :position => "WR",
          :team => "BUF",
          :points => 21.7
        }, {
          :name => "E. Sanders",
          :position => "WR/RB/TE",
          :team => "DEN",
          :points => 30.6
        }, {
          :name => "J. Witten",
          :position => "TE",
          :team => "DAL",
          :points => 13
        }, {
          :name => "D. Bailey",
          :position => "K",
          :team => "DAL",
          :points => 5
        }, {
          :name => "Cowboys",
          :position => "TM",
          :team => "DAL",
          :points => 11
        }]
      }
    }
  end
end
