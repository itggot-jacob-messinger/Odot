require 'pry-byebug'
class App < Sinatra::Base
  enable :sessions

	get '/' do
    unless session[:user_id]
      erb :welcome, layout: :not_logged_in_layout
    else
      redirect "/show_lists"
    end
  end

	get '/group/:name' do |name|
	    @group = group.first(name: name)
	    unless @group
	    	status 418
	    end
    end


  get '/welcome' do
    erb :welcome, layout: :not_logged_in_layout
  end

  get '/create/list' do
     if session[:user_id]
      erb :create
     else 
       redirect "/"
     end
  end

  post '/create/list' do
    list = List.create(name: params["listtitle"].upcase, user_id: 1)
    redirect "/list/#{list.id}"
  end

  post '/create/item' do 
    if List.get(params["list_id"].to_i).user.id
      Item.create(content: params["list_item"], list_id: params["list_id"].to_i)
      redirect back
    else
      redirect "/"
    end
  end


  get '/list/:id' do |id|
    @list = List.get(id)
    erb :list
  end


  post '/delete/item' do
    Item.get(params['item_id'].to_i).destroy
    redirect back
  end

  get '/login' do 
    erb :login, layout: :not_logged_in_layout
  end

  get '/register' do
    erb :register, layout: :not_logged_in_layout
  end

  post '/login' do
    user = User.first(username: params["username"])
    if user && user.password == params["password"]
      session[:user_id] = user.id
    end

    redirect "/"
  end

  post '/register' do
    if params["password"] == params["repeat_password"]
      @user = User.create(first_name: params["first_name"],
                  last_name: params["last_name"],
                  username: params["username"],
                  mail: params["email"],
                  password: params["password"])
      # puts "\n\n" + @user + "\n\n"
    end
    if @user
      session[:user_id] = @user.id
      redirect "/"
    else
      redirect back
    end #if @user
  end #post /register


  get '/show_lists' do
    if session[:user_id]
      @user = User.get(session[:user_id])
      erb :show_lists
    else
      redirect "/"
    end
  end

  get '/add_group/:id' do |id| 
    if session[:user_id]
      @list = List.get(id)
      @user = User.get(session[:user_id])
      erb :add_group
    else
      redirect "/"
    end
  end

  post '/add_group' do 
    if session[:user_id]
      list = List.get(params["list_id"].to_i)
      group = Group.get(params["group_id"].to_i)
      group = list.group
    else
      redirect '/'
    end
  end



end