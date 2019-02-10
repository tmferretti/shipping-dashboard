class RemoveShipmentIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shipment_id
    remove_column :shipments, :ship_addr_id
  end
end
