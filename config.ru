# Load path and gems/bundler
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require "bundler"
Bundler.require

# Local config
require "find"

%w{config/initializers lib}.each do |load_path|
  Find.find(load_path) { |f|
    puts "Maybe requiring #{f}?"
    require f unless f.match(/\/\..+$/) || File.directory?(f)
  }
end

# Load app
require "fantasy_wrapper"
run FantasyWrapper
