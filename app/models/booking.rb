class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, reject_if: lambda { |attributes| attributes["name"].blank? || attributes["email"].blank? }
  belongs_to :flight



end