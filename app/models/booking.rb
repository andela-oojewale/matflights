class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, reject_if: lambda { |attributes| attributes["name"].blank? || attributes["email"].blank? }
  belongs_to :flight

  def get_all_bookings
    select(:id, :no_of_passengers).includes(:flight_id).where(user_code: session[:user_id], provider: session[:provider], email: session[:email])
  end

end