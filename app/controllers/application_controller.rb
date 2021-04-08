class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id], name: session[:current_user_name])
  end
end
