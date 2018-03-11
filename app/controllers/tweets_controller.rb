class TweetsController < ApplicationController
  def index
    if params[:twitter_account_id]
      arel = TwitterAccount.find(params[:twitter_account_id]).tweets
    else
      arel = Tweet
    end
    @tweets = arel.paginate(page: params[:page]).order("tweeted_at DESC")
  end
end
