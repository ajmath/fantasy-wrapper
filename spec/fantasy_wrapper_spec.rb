require_relative "spec_helper"
require_relative "../fantasy_wrapper.rb"

def app
  FantasyWrapper
end

describe FantasyWrapper do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
