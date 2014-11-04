
class FFCurrentMatchup
  def self.get
    self.parse nil
  end

  def self.parse html
    [
      {
        :team1 => {
          :team_id => "123",
          :team_name => "Something about your mom",
          :team_name_short => "...",
          :score => 123.9,
          :players => [ {
            :full_name => "Peyton Manning",
            :abbrv_name => "P Manning",
            :position => "QB",
            :points => 28.8
          }, {
            :full_name => "Eddie Lacy",
            :abbrv_name => "E Lacy",
            :position => "RB",
            :points => 18.9
          }]
        },
        :team2 => {
          :team_id => "123",
          :team_name => "Something about your mom",
          :team_name_short => "...",
          :score => 123.9,
          :players => [ {
            :full_name => "Peyton Manning",
            :abbrv_name => "P Manning",
            :position => "QB",
            :points => 28.8
          }, {
            :full_name => "Eddie Lacy",
            :abbrv_name => "E Lacy",
            :position => "RB",
            :points => 18.9
          }]
        }
      }
    ]
  end
end
