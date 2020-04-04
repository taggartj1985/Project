require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('./model/game.rb')
require_relative('./model/publisher.rb')
also_reload('./models/*')


get '/' do
  erb(:index)
  end


get '/games' do
    @games = Game.all()
  erb(:games)
  end

get '/publishers' do
  @publishers = Publisher.all()
erb(:publishers)
end

get '/games/new' do
    @games = Game.all()
    @publishers = Publisher.all()
  erb(:new)
  end

  post '/games' do
  new_game = Game.new(params)
  new_game.save()
  erb(:create)
end
