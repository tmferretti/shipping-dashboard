# Delete prexisting data in tables. Delete wont run any callbacks so its much faster, given this seeds
# file is populating tables with alot of rows, sure. Typically I will use destroy in production code 
# outside of a seeds file.
Vendor.delete_all
Address.delete_all
Order.delete_all
LineItem.delete_all
Shipment.delete_all
