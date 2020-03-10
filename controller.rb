require('sinatra')
require('sinatra/contrib/all')

require_relative('models/film.rb')
require_relative('db/sql_runner.rb')
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/films' do
  @films = Film.all()
  erb(:index)
end

get '/films/:id' do
  id = params[:id].to_i
  @film = Film.get_by_id(id)
  erb(:film_by_id)
end
