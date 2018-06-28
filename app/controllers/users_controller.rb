class UsersController < ApplicationController
  get '/' do
    erb :index
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  end
end
