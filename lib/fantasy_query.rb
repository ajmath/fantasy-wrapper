require 'httparty'
require 'json'

class FantasyQuery
  #
  def initialize(league_id = nil, team_id = nil)
    @league_id = league_id
    @team_id = team_id
  end

  def get
    url = get_url()
    $logger.info "Requesting: #{url}"
    resp = HTTParty.get(url)
    $logger.info "  #{resp.code} - #{resp.message}"
    if resp.code != 200 then
      raise "Recieved non-200 status, you get nothing"
    else
      parse(resp.body)
    end
  end

  def fetch
    begin
      [200, get().to_json]
    rescue => e
      $logger.fatal "Error parsing response"
      $logger.fatal e
      [500, e.message.to_json]
    end
  end

  def get_url
    raise Exception.new "Not implemented"
  end

  def parse
    raise Exception.new "Not implemented"
  end
end
