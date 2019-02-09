class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :number
      t.decimal :total, :precision => 8, :scale => 2
      t.string :shipment_state
      t.integer :shipment_id

      t.timestamps
    end
  end
end
