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
