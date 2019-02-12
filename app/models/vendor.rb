class Vendor < ApplicationRecord
  has_many :orders
  has_many :addresses

  scope :critically_late_orders, joins(:orders).where
end
