class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    session[:current_user_name] = user.name
    session[:current_user_id] = user.id
  end
end
