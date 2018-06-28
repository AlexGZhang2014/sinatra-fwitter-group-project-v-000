class UsersController < ApplicationController
  get '/' do
    erb :index
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    
  end
end
