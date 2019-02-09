class ShipmentAddress < ApplicationRecord
  belongs_to :shipment
  belongs_to :address
end
