# require 'opal-sprockets'
require 'opal/sprockets/server'
require "./rack-custom_404.rb"

require 'hyperloop-config'
require 'rubygems'
require 'opal-rails'
require 'hyper-operation'
require 'hyper-store'
require 'hyper-router'
require 'opal-browser'
require 'opal-jquery'

require 'bundler'
Bundler.require

my_404_page_content = File.read("./404.html")
use Rack::Custom404, my_404_page_content

Opal::Config.source_map_enabled = false

run Opal::Sprockets::Server.new { |server|

  server.source_map = false
  server.main = 'app'
  server.append_path 'app'
  server.index_path = './app/index.html.erb'
}
