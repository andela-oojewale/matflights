class SessionsController < ApplicationController

  include Commons

  def create
    get_sessions(env["omniauth.auth"]) if env["omniauth.auth"]
    User.save_info(session[:provider], session[:user_id], session[:name], session[:email])
    if session[:query]
      redirect_to book_path session[:query]
    else
      redirect_to dashboard_path
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end

end