class UpdateManufacturerAddresses < ActiveRecord::Migration[7.0]
  def change
    rename_column :manufacturers, :address, :address1
    add_column :manufacturers, :address2, :text
    add_column :manufacturers, :address3, :text
  end
end
