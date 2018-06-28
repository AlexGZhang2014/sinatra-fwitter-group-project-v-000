class TweetsController < ApplicationController
  get '/tweets' do
    @tweets = Tweet.all
    erb :'tweets/index'
  end
  
  get '/tweets/new' do
    erb :'tweets/new'
  end
  
  post '/tweets' do
    if !params[:content].empty?
      @tweet = Tweet.create(content: params[:content])
    end
    redirect to "/tweets/#{@tweet.id}"
  end
  
  get '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    erb :'tweets/show'
  end
end
