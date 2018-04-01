class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_logged_in

  protected

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def check_logged_in
    redirect_to new_login_path unless current_user
  end
end
