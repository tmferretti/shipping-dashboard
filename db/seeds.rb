# Helper methods for seeds file
def generate_shipment_state
  %w(pending_shipment shipped delivered).sample
end

def generate_clean_phone_number
  # Faker gem's phone number method will create a phone number adhering to a couple different phone number
  # formats. I wrote this helper method to generate fake phone numbers in the format that
  # I would have them be cleaned to before entering the DB from a form

  Faker::Config.locale = 'en-US'
  "(#{Faker::PhoneNumber.area_code}) #{rand(10..99)}#{rand(1..9)}-#{rand(1000..9999)}"
end


# Delete prexisting data in tables. Delete wont run any callbacks so its much faster, given this seeds
# file is populating tables with alot of rows, sure. Typically I will use destroy in production code 
# outside of a seeds file.
Vendor.delete_all
Address.delete_all
Order.delete_all
LineItem.delete_all
Shipment.delete_all

# load file of valid addresses
addresses_json = ActiveSupport::JSON.decode(File.read('db/valid_addresses.json')).with_indifferent_access
valid_addresses = addresses_json[:addresses]

# the number of valid addresses in the json file is 99, which nicely allows us 
# to have 33 vendors each with three addresses to choose from
valid_addresses.in_groups_of(33, false).each do |group|

  # create vendor to own each group of addresses
  vendor = Vendor.new
  vendor.name = "#{Faker::Company.name} #{Faker::Company.suffix}"
  vendor.industry = Faker::Company.industry
  vendor.logo = Faker::Company.logo
  vendor.save
  
  # create addresses for vendor
  group.each do |valid_address|
    address = Address.new

    address.first_name = Faker::Name.first_name
    address.last_name = Faker::Name.last_name

    address.address1 = valid_address[:address1]
    address.address2 = valid_address[:address2]
    address.city = valid_address[:city]
    address.zipcode = valid_address[:postalCode]
    address.state = valid_address[:state]
    address.country = "USA" # for now, the valid address file only has US data, Im downloading a global one, but its massive (10GB) and will need to be parsed because *I think* I dont need that many addresses for this

    address.phone = generate_clean_phone_number
    address.alternative_phone = generate_clean_phone_number

    address.company = vendor.name
    address.vendor = vendor

    address.save
  end

  # create orders for the vendor
  1_000.times do
    order = Order.new
    order.shipment_state = generate_shipment_state
    order.save

    # create line_items for order
    rand(1..5).times do
      line_item = LineItem.new

      line_item.order = order
      line_item.product_name = Faker::Commerce.product_name
      line_item.price = Faker::Commerce.price.to_d

      line_item.save
    end

    # create shipment for order
    shipment = Shipment.new
    shipment.addresses << vendor.addresses.sample

    case order.shipment_state
      when "shipped"
        # future
        reference_date = Faker::Date.between(3.days.from_now, Date.today)
      when "pending_shipment"
        # future
        reference_date = Faker::Date.between(6.days.from_now, Date.today)
      when "delivered"
        # past
        reference_date = Faker::Date.between(100.days.ago, Date.today)
        shipment.delivered_at = reference_date + rand(-3..3).days
    end

    shipment.est_arrival_date = reference_date
    shipment.shipped_at = reference_date - rand(2..5).days

    shipment.order = order
    shipment.save
  end
end
