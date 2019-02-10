json.first_name address.first_name
json.last_name address.last_name
json.address1 address.address1
json.address2 address.address2
json.address3 address.try(:address3)
json.city address.city
json.zipcode address.zipcode
json.phone address.phone
json.alternative_phone address.alternative_phone
json.company address.company
json.state address.state
json.country address.country
json.latitude address.latitude
json.longitude address.longitude

json.partial! 'vendors/vendor', vendor: address.vendor