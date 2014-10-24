
class FFTeamList
  def self.get
    self.parse nil
  end

  def self.parse html
    [
      {
        :id => "1095147",
        :name => "Something about your mom",
        :owner => "matheeeny"
      },
      {
        :id => "1121906",
        :name => "Hemingway squandered half his life hanging around Picasso, trying to nail his leftovers",
        :owner => "RitaRap"
      }
    ]
  end
end
