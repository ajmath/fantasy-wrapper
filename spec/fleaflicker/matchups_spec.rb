require_relative "../spec_helper"
require_relative "../../lib/fleaflicker/teamlist.rb"

describe FFMatchups do

  it "builds correct url" do
    url = FFMatchups.new("55443322").get_url
    url.must_equal "http://www.fleaflicker.com/nfl/league-schedule?leagueId=55443322"
  end

  it "parses matchups correctly" do
    file = File.open(File.dirname(__FILE__) + "/matchups_test0.html", "rb")

    result = FFMatchups.new.parse file.read

    result.size.must_equal 5

    result.must_include ({
      :team1_id => "1094213",
      :team2_id => "1121905",
      :game_id => "29278823"
    })
    result.must_include ({
      :team1_id => "1095147",
      :team2_id => "1121906",
      :game_id => "29278824"
    })
    result.must_include ({
      :team1_id => "1104075",
      :team2_id => "1119517",
      :game_id => "29278820"
    })
    result.must_include ({
      :team1_id => "1105114",
      :team2_id => "1119741",
      :game_id => "29278821"
    })
    result.must_include ({
      :team1_id => "1118816",
      :team2_id => "1121666",
      :game_id => "29278822"
    })
  end
end
