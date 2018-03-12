class TweetsController < ApplicationController
  def index
    if params[:twitter_account_id]
      @twitter_account = TwitterAccount.find(params[:twitter_account_id])
      arel = @twitter_account.tweets
    else
      arel = Tweet
    end
    @tweets = arel.paginate(page: params[:page]).order("tweeted_at DESC")
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end
