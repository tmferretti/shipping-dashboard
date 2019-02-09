class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.integer :zipcode
      t.string :phone
      t.string :alternative_phone
      t.string :company
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
