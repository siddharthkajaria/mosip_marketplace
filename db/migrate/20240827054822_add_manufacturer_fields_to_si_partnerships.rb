class AddManufacturerFieldsToSiPartnerships < ActiveRecord::Migration[7.0]
  def change
    add_column :si_partnerships, :address1, :text
    add_column :si_partnerships, :address2, :text
    add_column :si_partnerships, :address3, :text
    add_column :si_partnerships, :email_one, :string
    add_column :si_partnerships, :email_two, :string
    add_column :si_partnerships, :email_three, :string
    add_column :si_partnerships, :image_data, :text
    add_column :si_partnerships, :phone_one, :string
    add_column :si_partnerships, :phone_two, :string
    add_column :si_partnerships, :phone_three, :string
    add_column :si_partnerships, :website_link, :string
  end
end
