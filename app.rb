# app/app.rb

# install and require all dependencies
require 'sinatra/base'
require 'sprockets'
require 'uglifier'
require 'sass'
require 'coffee-script'
require 'execjs'

class MyApp < Sinatra::Base
  # initialize new sprockets environment
  set :environment, Sprockets::Environment.new

  # append assets paths
  environment.append_path "assets/stylesheets"
  environment.append_path "assets/javascripts"
  environment.append_path "assets/vendor"
  environment.append_path "assets/img"

  # compress assets
  # environment.js_compressor  = :uglify
  environment.css_compressor = :scss

  # get assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  get "/" do
    erb :index
  end
end
