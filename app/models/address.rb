class Address < ApplicationRecord
  belongs_to :vendor
  has_many :shipment_addresses
  has_many :shipments, through: :shipment_addresses
end
