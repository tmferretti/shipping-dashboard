class OrderCreator  
  def self.create_order(params)
    order = Order.new
    order.number = params[:order_num]
    order.vendor = Vendor.find(params[:vendor_id])

    shipment = Shipment.new
    shipment.tracking_num = params[:tracking_num]
    shipment.addresses << Address.find(params[:address_id])

    order.shipment = shipment
    order.create_fake_line_items
    order.update_totals
    order.save!

    order
  end
end
