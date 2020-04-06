require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../model/game.rb' )
require_relative( '../model/publisher.rb' )
also_reload( '../models/*' )


get '/games' do
    @games = Game.all()
  erb(:"games/index")
  end

get '/games/table' do
    @games = Game.all()
  erb(:"games/table")
  end


get '/games/new' do
    @games = Game.all()
    @publishers = Publisher.all()
  erb(:"games/new")
  end

  post '/games' do
  new_game = Game.new(params)
  new_game.save()
  redirect to ("/games")
end

get '/games/:id/edit' do
  id = params['id'].to_i()
  @games = Game.find(id)
  erb(:"games/edit")
end

get '/games/:id' do
  id = params['id'].to_i()
  @games = Game.find(id)
  erb(:"games/show")
end
