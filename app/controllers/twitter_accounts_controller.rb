class TwitterAccountsController < ApplicationController
  def index
    @twitter_accounts = TwitterAccount.all
  end

  def new
    @twitter_account = TwitterAccount.new
  end
end
