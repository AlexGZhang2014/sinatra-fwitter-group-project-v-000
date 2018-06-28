class TweetsController < ApplicationController
  get '/tweets/new' do
    erb :'tweets/new'
  end
  
  post '/tweets' do
    if !params[:content].empty?
      @tweet = Tweet.create(content: params[:content])
    end
    redirect to "/tweets/#{@tweet.id}"
  end
end
