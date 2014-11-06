require 'json'
require 'logger'

require_relative 'lib/fleaflicker/teamlist'
require_relative 'lib/fleaflicker/current_matchup'

class FantasyWrapper < Sinatra::Base

  configure :production do
    set :haml, { :ugly=>true }
    set :clean_trace, true

    Dir.mkdir('logs') unless File.exist?('logs')

    $logger = Logger.new('logs/common.log','weekly')
    $logger.level = Logger::WARN

    # Spit stdout and stderr to a file during production
    # in case something goes wrong
    $stdout.reopen("logs/output.log", "w")
    $stdout.sync = true
    $stderr.reopen($stdout)
  end

  configure :development do
    $logger = Logger.new(STDOUT)
  end

  set :public_folder => "public", :static => true




  get "/currentmatchup/ff" do
    $logger.info "league: #{params[:league]}, team: #{params[:team]}"
    content_type :json
    FFCurrentMatchup.new(params[:league], params[:team]).fetch
  end

  get "/healthcheck" do
    [200, "mmm bow bow, oh yeah"]
  end
end
