class Shipment < ApplicationRecord
  belongs_to :order
  has_many :shipment_addresses
  has_many :addresses, through: :shipment_addresses
end
