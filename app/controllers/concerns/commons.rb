module Commons

  extend ActiveSupport::Concern

  included do
    # Add any callbacks here later.
  end

  def show_search
    render "flights/show_search"
  end

  def booking_info
    session[:no_of_passengers] = params[:pass]
    session[:dept] = params[:dept]
    session[:dest] = params[:dest]
    session[:flight_time] = params[:flight_datetime]
    session[:airline] = params[:airline]
    session[:total_cost] = params[:cost].to_i * params[:pass].to_i
  end

  def get_sessions(auth_param)
    session[:provider] = auth_param[:provider]
    session[:user_id] = auth_param[:uid]
    session[:name] = auth_param[:info][:name]
    session[:email] = auth_param[:info][:email]
    session[:image] = auth_param[:info][:image]
  end

end