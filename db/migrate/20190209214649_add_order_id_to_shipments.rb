class AddOrderIdToShipments < ActiveRecord::Migration[5.2]
  def change
    add_column :shipments, :order_id, :integer
  end
end
