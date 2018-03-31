class SessionsController < ApplicationController
  def create
    # Do something link this to avoid people from_logging_in
    # @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:current_user] = auth_hash[:info]
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
