require_relative "../spec_helper"
require_relative "../../lib/fleaflicker/teamlist.rb"

describe FFTeamList do
  before { skip } #disabling this until we actually parse teams

  it "parses teamlist correctly" do
    file = File.open(File.dirname(__FILE__) + "/teamlist_test0.html", "rb")

    result = FFTeamList::parse file.read

    result.size.must_equal 10

    result.must_include ({
      :id => "1095147",
      :name => "Something about your mom",
      :owner => "matheeeny"
    })
    result.must_include ({
      :id => "1118816",
      :name => "a ray of blood all over my wifes homemade rice",
      :owner => "manninAllPrius"
    })
    result.must_include ({
      :id => "1105114",
      :name => "4th and Schlong",
      :owner => "Rikamin1"
    })
    result.must_include ({
      :id => "1104075",
      :name => "the damn hangover friendly",
      :owner => "Quintos"
    })
    result.must_include ({
      :id => "1094213",
      :name => "Domestic Dispute",
      :owner => "Flbrk33"
    })
    result.must_include ({
      :id => "1119517",
      :name => "weezy but ain't asthmatic",
      :owner => "TwerkCityofAngl"
    })
    result.must_include ({
      :id => "1119741",
      :name => "The BradyBunch",
      :owner => "flbrk33dad"
    })
    result.must_include ({
      :id => "1121906",
      :name => "Hemingway squandered half his life hanging around Picasso, trying to nail his leftovers",
      :owner => "RitaRap"
    })
    result.must_include ({
      :id => "1121666",
      :name => "Bot1",
      :owner => "Bot1"
    })
    result.must_include ({
      :id => "1121905",
      :name => "brownpanthers",
      :owner => "brownpanthers"
    })
  end
end
