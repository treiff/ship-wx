require 'json'
require './config/environment'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/ships.json' do
    content_type :json
    Ship.all.to_json
  end

end
