class UsersController < ApplicationController
  get '/' do
    erb :index
  end
  
  get '/signup' do
    if logged_in?
      redirect to "/tweets"
    else
      erb :'users/signup'
    end
  end
  
  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect to "/tweets"
    else
      redirect to "/signup"
    end
  end
  
  get '/login' do
    if logged_in?
      redirect to "/tweets"
    else
      erb :'users/login'
    end
  end
  
  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/tweets"
    else
      redirect to "/login"
    end
  end
  
  get '/logout' do 
    session.clear
    redirect '/'
  end
  
  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end
