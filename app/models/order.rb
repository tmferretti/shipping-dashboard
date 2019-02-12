class Order < ApplicationRecord
  belongs_to :vendor
  has_many :line_items
  has_many :shipments

  before_create :generate_order_number

  scope :critically_late_orders, shipments.where('est_arrival_date >= ?', Shipments.all.collect{|ship| ship.est_arrival_date}.mean * 2)
  scope :late_orders, shipments.where('est_arrival_date <= and est_arrival_date >= ?', Shipments.all.collect{|ship| ship.est_arrival_date}.mean * 2, Shipments.all.collect{|ship| ship.est_arrival_date}.mean * 1.5)
  scope :on_time_orders, shipments.where('est_arrival_date < ?', Shipments.all.collect{|ship| ship.est_arrival_date}.mean * 1.5)

  def update_totals
    self.total = self.line_items.map(&:price).sum
  end

  def generate_order_number
    # quick method to generate unique order numbers
    return if self.number

    unique = false
    while !unique
      random = "N#{Array.new(9) { rand(9) }.join}"
      unique = true unless self.class.find_by(:number => random)
    end

    self.number = random
    self.number
  end

  def create_fake_line_items
    rand(2..5).times do
      self.line_items.build(
        product_name: Faker::Commerce.product_name,
        price: Faker::Commerce.price.to_d
        )
    end
  end

end
