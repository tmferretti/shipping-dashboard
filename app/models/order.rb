class Order < ApplicationRecord
  belongs_to :vendor
  has_many :line_items
  has_many :shipments
end
