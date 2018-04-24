class LoginsController < ApplicationController
  layout 'login'

  skip_before_action :check_logged_in

  def new
    # TODO: redirect if already logged in...
  end
end
