class UsersController < ApplicationController
  get '/' do
    erb :index
  end
  
  get '/signup' do
    erb :'users/signup'
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
    erb :'users/login'
  end
  
  post '/login' do
    if !params[:username].empty? && !params[:password].empty?
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
end
