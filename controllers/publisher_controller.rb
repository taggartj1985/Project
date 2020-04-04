require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../model/game.rb' )
require_relative( '../model/publisher.rb' )
also_reload( '../models/*' )


get '/publishers' do
  @publishers = Publisher.all()
erb(:"publishers/index")
end
