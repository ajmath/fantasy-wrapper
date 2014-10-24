require 'json'

require_relative 'lib/fleaflicker/teamlist'

class FantasyWrapper < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/teamlist/ff/:league_id" do
    content_type :json
    FFTeamList::get.to_json
  end
end
