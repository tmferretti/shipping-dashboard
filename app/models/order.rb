class Order < ApplicationRecord
  belongs_to :vendor
  has_many :line_items
  has_many :shipments

  before_create :generate_order_number, :update_totals

  def update_totals
   self.total = self.line_items.map(&:price).sum
  end

  def generate_order_number
    # quick method to generate unique order numbers
    unique = false
    while !unique
      random = "N#{Array.new(9) { rand(9) }.join}"
      unique = true unless self.class.find_by(:number => random)
    end

    self.number = random
    self.number
  end
end
