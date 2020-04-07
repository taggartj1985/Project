require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../model/game.rb' )
require_relative( '../model/publisher.rb' )
also_reload( '../models/*' )


get '/publishers' do
  @publishers = Publisher.all()
erb(:"publishers/index")
end

get '/publishers/new' do
    @publishers = Publisher.all()
  erb(:"publishers/new")
  end

  get '/publishers/quick' do
      @publishers = Publisher.all()
    erb(:"publishers/quick")
    end

  post '/publishers' do
  new_publisher = Publisher.new(params)
  new_publisher.save()
  redirect to ("/publishers")
  end

  get '/publishers/:id/edit' do
    id = params['id'].to_i()
    @publishers = Publisher.find(id)
    erb(:"/publishers/edit")
  end
