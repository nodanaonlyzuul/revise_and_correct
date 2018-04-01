class SessionsController < ApplicationController
  skip_before_action :check_logged_in

  def create
    @user = User.find_by_screen_name(auth_hash.info.nickname)
    session[:user_id] = @user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_login_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
