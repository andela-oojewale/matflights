class SessionsController < ApplicationController

  include Commons

  def new

  end

  def create
    get_sessions(env["omniauth.auth"]) if env["omniauth.auth"]
    User.save_info(session[:provider], session[:user_id], session[:name], session[:email])
    redirect_to log_path
  end

  def destroy
    session.clear
    redirect_to root_url
  end

end