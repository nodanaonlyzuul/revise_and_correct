class TwitterAccountsController < ApplicationController
  def index
    @twitter_accounts = TwitterAccount.all
  end

  def new
    @twitter_account = TwitterAccount.new
  end

  def create
    api_twitter_account = twitter_client.user(params[:screen_name])
    @twitter_account = TwitterAccount.new(
      twitter_id:  api_twitter_account.id,
      screen_name: api_twitter_account.screen_name,
      original_response: api_twitter_account.to_json
    )

    @twitter_account.save!
    redirect_to twitter_accounts_path, flash: {notice: "Added #{@twitter_account.screen_name}"}
  end

  private

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets[:twitter_consumer_key]
      config.consumer_secret     = Rails.application.secrets[:twitter_consumer_secret]
      config.access_token        = Rails.application.secrets[:twitter_access_key]
      config.access_token_secret = Rails.application.secrets[:twitter_access_secret]
    end
  end
end
