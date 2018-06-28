class TweetsController < ApplicationController
  get '/tweets/new' do
    erb :'tweets/new'
  end
  
  post '/tweets' do
    @tweet = Tweet.create(content: params[:content])
  end
end
