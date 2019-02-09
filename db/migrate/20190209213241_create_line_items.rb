class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.string :product_name
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
