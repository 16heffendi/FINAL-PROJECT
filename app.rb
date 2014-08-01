require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/scraper.rb'


get '/' do
  erb :index 
end