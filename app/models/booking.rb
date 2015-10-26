class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers
  belongs_to :flight
end