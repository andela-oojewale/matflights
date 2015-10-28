class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, reject_if: lambda { |attributes| attributes["name"].blank? || attributes["email"].blank? }
  belongs_to :flight

  validates :confirmation_code, presence: true, uniqueness: true

  def get_all_bookings(user_id, provider, email)
    Booking.includes(:flight).where(user_code: user_id, provider: provider, email: email)
  end

end