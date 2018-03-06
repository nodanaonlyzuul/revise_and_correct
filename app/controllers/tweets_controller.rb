class TweetsController < ApplicationController
  def index
    @tweets = Tweet.paginate(page: params[:page]).order("tweeted_at DESC")
  end
end
