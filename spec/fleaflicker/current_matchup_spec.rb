require_relative "../spec_helper"
require_relative "../../lib/fleaflicker/teamlist.rb"

describe FFCurrentMatchup do
  it "parses current correctly" do
    file = File.open(File.dirname(__FILE__) + "/current_matchup_test0.html", "rb")

    result = FFCurrentMatchup.new.parse file.read

    result[:team1].wont_be_nil
    result[:team1][:team_id].must_equal "1095147"
    result[:team1][:team_name].must_equal "Something about your mom"
    result[:team1][:score].must_equal 138.34
    result[:team1][:players].length.must_equal 9
    result[:team1][:players][0][:name].must_equal "P. Manning"
    result[:team1][:players][0][:position].must_equal "QB"
    result[:team1][:players][0][:team].must_equal "DEN"
    result[:team1][:players][0][:points].must_equal 29.44
    result[:team1][:players][1][:name].must_equal "B. Brown"
    result[:team1][:players][1][:position].must_equal "RB"
    result[:team1][:players][1][:team].must_equal "BUF"
    result[:team1][:players][1][:points].must_equal 1.5
    result[:team1][:players][2][:name].must_equal "E. Lacy"
    result[:team1][:players][2][:position].must_equal "RB"
    result[:team1][:players][2][:team].must_equal "GB"
    result[:team1][:players][2][:points].must_equal 18.2
    result[:team1][:players][3][:name].must_equal "G. Tate"
    result[:team1][:players][3][:position].must_equal "WR"
    result[:team1][:players][3][:team].must_equal "DET"
    result[:team1][:players][3][:points].must_equal 21.1
    result[:team1][:players][4][:name].must_equal "T. Hilton"
    result[:team1][:players][4][:position].must_equal "WR"
    result[:team1][:players][4][:team].must_equal "IND"
    result[:team1][:players][4][:points].must_equal 21.5
    result[:team1][:players][5][:name].must_equal "D. Baldwin"
    result[:team1][:players][5][:position].must_equal "RB/WR.."
    result[:team1][:players][5][:team].must_equal "SEA"
    result[:team1][:players][5][:points].must_equal 6.1
    result[:team1][:players][6][:name].must_equal "M. Bennett"
    result[:team1][:players][6][:position].must_equal "TE"
    result[:team1][:players][6][:team].must_equal "CHI"
    result[:team1][:players][6][:points].must_equal 15.5
    result[:team1][:players][7][:name].must_equal "B. Walsh"
    result[:team1][:players][7][:position].must_equal "K"
    result[:team1][:players][7][:team].must_equal "MIN"
    result[:team1][:players][7][:points].must_equal 8
    result[:team1][:players][8][:name].must_equal "Browns"
    result[:team1][:players][8][:position].must_equal "TM"
    result[:team1][:players][8][:team].must_equal "CLE"
    result[:team1][:players][8][:points].must_equal 17

    result[:team2].wont_be_nil
    result[:team2][:team_id].must_equal "1121906"
    result[:team2][:team_name].must_equal "Hemingway squandered half his life hanging around Picasso, trying t..."
    result[:team2][:score].must_equal 150.46
    result[:team2][:players].length.must_equal 9
    result[:team2][:players][0][:name].must_equal "C. Palmer"
    result[:team2][:players][0][:position].must_equal "QB"
    result[:team2][:players][0][:team].must_equal "ARI"
    result[:team2][:players][0][:points].must_equal 25.16
    result[:team2][:players][1][:name].must_equal "S. Jackson"
    result[:team2][:players][1][:position].must_equal "RB"
    result[:team2][:players][1][:team].must_equal "ATL"
    result[:team2][:players][1][:points].must_equal 12
    result[:team2][:players][2][:name].must_equal "D. Murray"
    result[:team2][:players][2][:position].must_equal "RB"
    result[:team2][:players][2][:team].must_equal "DAL"
    result[:team2][:players][2][:points].must_equal 20.1
    result[:team2][:players][3][:name].must_equal "A. Jeffery"
    result[:team2][:players][3][:position].must_equal "WR"
    result[:team2][:players][3][:team].must_equal "CHI"
    result[:team2][:players][3][:points].must_equal 11.9
    result[:team2][:players][4][:name].must_equal "S. Watkins"
    result[:team2][:players][4][:position].must_equal "WR"
    result[:team2][:players][4][:team].must_equal "BUF"
    result[:team2][:players][4][:points].must_equal 21.7
    result[:team2][:players][5][:name].must_equal "E. Sanders"
    result[:team2][:players][5][:position].must_equal "RB/WR.."
    result[:team2][:players][5][:team].must_equal "DEN"
    result[:team2][:players][5][:points].must_equal 30.6
    result[:team2][:players][6][:name].must_equal "J. Witten"
    result[:team2][:players][6][:position].must_equal "TE"
    result[:team2][:players][6][:team].must_equal "DAL"
    result[:team2][:players][6][:points].must_equal 13
    result[:team2][:players][7][:name].must_equal "D. Bailey"
    result[:team2][:players][7][:position].must_equal "K"
    result[:team2][:players][7][:team].must_equal "DAL"
    result[:team2][:players][7][:points].must_equal 5
    result[:team2][:players][8][:name].must_equal "Cowboys"
    result[:team2][:players][8][:position].must_equal "TM"
    result[:team2][:players][8][:team].must_equal "DAL"
    result[:team2][:players][8][:points].must_equal 11
  end
end
