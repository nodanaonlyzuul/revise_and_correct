require 'twitter_client'

class TwitterAccountsController < ApplicationController
  def index
    @twitter_accounts = TwitterAccount.all
  end

  def new
    @twitter_account = TwitterAccount.new
  end

  def create
    api_twitter_account = TwitterClient.new.rest_client.user(params[:twitter_account][:screen_name])
    @twitter_account = TwitterAccount.new(
      twitter_id:  api_twitter_account.id,
      screen_name: api_twitter_account.screen_name,
      original_response: api_twitter_account.to_json
    )

    @twitter_account.save!
    redirect_to twitter_accounts_path, flash: {notice: "Added #{@twitter_account.screen_name}"}
  end

end
