class TweetsController < ApplicationController
  get '/tweets' do
    if logged_in?
      @tweets = current_user.tweets
      erb :'tweets/index'
    else
      redirect to "/login"
    end
  end
  
  get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect to "/login"
    end
  end
  
  post '/tweets' do
    if !params[:content].empty?
      @tweet = Tweet.new(content: params[:content])
      redirect to "/tweets/#{@tweet.id}"
    else
      redirect to "/tweets/new"
    end
  end
  
  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'tweets/show'
    else
      redirect to "/login"
    end
  end
  
  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'tweets/edit'
    else
      redirect to "/login"
    end
  end
  
  patch '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    if !params[:content].empty?
      @tweet.content = params[:content]
      @tweet.save
      redirect to "/tweets/#{@tweet.id}"
    else
      redirect to "/tweets/#{@tweet.id}/edit"
    end
  end
  
  delete '/tweets/:id/delete' do
    @tweet = Tweet.find_by_id(params[:id])
    if logged_in? && current_user.tweets.include?(@tweet)
      @tweet.delete
      redirect to '/tweets'
    elsif logged_in?
      redirect to '/tweets'
    else
      redirect to '/login'
    end
  end
end
