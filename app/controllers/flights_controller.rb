class FlightsController < ApplicationController
  attr_accessor :pass_num

  include Commons

  def index
    @flights_list = Flight.new.get_all_flights.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    to = flight_params[:to_id]
    from = flight_params[:from_id]
    dept_time  =  flight_params[:dept_time]
    message = Flight.new.valid_airports(from, to)
    if message.nil?
      @flights_list = Flight.new.search_flight(to, from , dept_time)
      if @flights_list.kind_of? String
       flash[:notice] = @flights_list
      else
        return show_search
      end
    else
      flash[:notice] = message
    end
    redirect_to root_url
  end

  def create

  end

  protected

  def flight_params
      params.require(:flight).permit(:from_id, :to_id, :dept_time, :ret_time)
  end

  # def flight_info
  #   session[:no_of_passengers] =
  #   session[:dept] =
  #   session[:dest] =
  #   session[:flight_time] = flight_params[:dept_time]
  # end

end