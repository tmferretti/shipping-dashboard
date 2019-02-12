class AddVendorIdColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :vendor_id, :integer
  end
end
