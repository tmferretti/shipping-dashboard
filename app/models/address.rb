class Address < ApplicationRecord
  belongs_to :vendor
  has_many :shipment_addresses
  has_many :shipments, through: :shipment_addresses, dependent: :destroy

  geocoded_by :pretty_address

  # after_validation :geocode # for after initial seed

  def pretty_address
    "#{address1}, #{address2 if address2}, #{city}, #{state}, #{country}"
  end
end
