json.number order.number
json.total order.total
json.shipment_state order.shipment_state

json.vendor order.vendor, partial: 'vendors/vendor', as: :vendor
json.shipments order.shipments, partial: 'shipments/shipment', as: :shipment