class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(name: session[:current_user_name])
  end
end
