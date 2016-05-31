require 'pry-byebug'
class App < Sinatra::Base
  enable :sessions

  	get '/' do
        # @groups = Group.all
        erb :index
    end

	get '/group/:name' do |name|
	    @group = group.first(name: name)
	    unless @group
	    	status 418
	    end
    end


  get '/welcome' do
    erb :welcome
  end

  get '/create/list' do
    erb :create

  end

  post '/create/list' do
    list = List.create(name: params["listtitle"].upcase, user_id: 1)
    redirect "/list/#{list.id}"
  end


  get '/list/:id' do |id|
    erb :list
  end
end
