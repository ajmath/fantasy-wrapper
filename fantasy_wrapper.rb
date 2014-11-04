require 'json'

require_relative 'lib/fleaflicker/teamlist'
require_relative 'lib/fleaflicker/current_matchup'

class FantasyWrapper < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/teamlist/ff?" do
    puts "league = #{params[:league]}"
    content_type :json
    FFTeamList::get.to_json
  end

  get "/currentmatchup/ff" do
    puts "league = #{params[:league]}, team = #{params[:team]}"
    content_type :json
    FFCurrentMatchup::get.to_json
  end
end
