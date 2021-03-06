# Load path and gems/bundler
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require "bundler"
Bundler.require

# Local config
require "find"

%w{config/initializers lib}.each do |load_path|
  full_path = File.dirname(__FILE__) + "/" + load_path
  Find.find(full_path) { |f|
    require f unless f.match(/\/\..+$/) || File.directory?(f)
  } unless not File.exists? full_path
end

# Load app
require "fantasy_wrapper"
run FantasyWrapper
