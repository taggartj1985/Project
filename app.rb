require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/game_controller')
require_relative('controllers/publisher_controller')

get '/' do
  erb(:index)
  end
