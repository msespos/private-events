class SessionsController < ApplicationController
  def new
  end

  def create
    session[:name] = @user.name
    redirect_to new_sessions_path
  end
end
