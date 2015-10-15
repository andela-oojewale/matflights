class SessionsController < ApplicationController

  def new

  end

  def create
    get_sessions(env["omniauth.auth"]) if env["omniauth.auth"]
    Passenger.save_info(session[:provider], session[:user_id], session[:name], session[:email])
    redirect_to log_path
  end

  def destroy
    session.clear
    redirect_to root_url
  end

  private

  def get_sessions(auth_param)
      require "pry"; binding.pry
    session[:provider] = auth_param[:provider]
    session[:user_id] = auth_param[:uid]
    session[:name] = auth_param[:info][:name]
    session[:email] = auth_param[:info][:email]
    session[:image] = auth_param[:info][:image]
  end

end
