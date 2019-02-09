class CreateShipmentAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipment_addresses do |t|
      t.integer :address_id
      t.integer :shipment_id

      t.timestamps
    end
  end
end
