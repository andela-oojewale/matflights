class Airport < ActiveRecord::Base
  has_many :froms, class_name: "Flight", foreign_key: :from
  has_many :tos, class_name: "Flight", foreign_key: :to

end
