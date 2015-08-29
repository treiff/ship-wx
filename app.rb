class App < Sinatra::Base
require 'sinatra-activerecord'
require 'db/connection'

  get '/' do
    erb :index
  end

end
