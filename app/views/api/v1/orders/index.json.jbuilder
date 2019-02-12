json.critically_late @orders.critically_late_orders, partial: 'api/v1/orders/order', as: :order
json.late @orders.critically_late_orders, partial: 'api/v1/orders/order', as: :order
json.on_time @orders.on_time_orders, partial: 'api/v1/orders/order', as: :order
