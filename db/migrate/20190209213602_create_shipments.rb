class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :tracking_num
      t.integer :ship_addr_id
      t.datetime :est_arrival_date
      t.datetime :shipped_at
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
