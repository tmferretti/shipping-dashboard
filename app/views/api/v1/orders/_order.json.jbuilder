json.number order.number
json.total order.total
json.shipment_state order.shipment_state

json.vendor order.vendor, partial: 'api/v1/vendors/vendor', as: :vendor
json.shipments order.shipments, partial: 'api/v1/shipments/shipment', as: :shipment
