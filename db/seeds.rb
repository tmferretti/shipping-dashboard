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
  
  group.each do |valid_address|
    address = Address.new
    address.first_name = Faker::Name.first_name
    address.last_name = Faker::Name.last_name
    address.address1 = valid_address[:address1]
    address.address2 = valid_address[:address2]
    # address.address3 = nil
    address.city = valid_address[:city]
    address.zipcode = valid_address[:postalCode]
    address.phone = generate_clean_phone_number
    address.alternative_phone = generate_clean_phone_number
    address.company = vendor.name
    address.state = valid_address[:state]
    address.country = "USA" # for now, the valid address file only has US data, Im downloading a global one, but its massive (10GB) and will need to be parsed because *I think* I dont need that many addresses for this
    address.vendor = vendor
    # vendor.addresses << address if address.save
  end

  # create orders for the vendor
  1_000.times do
    order = Order.new
    order.shipment_state = generate_shipment_state
    order.save
  end
end