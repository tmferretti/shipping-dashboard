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
end