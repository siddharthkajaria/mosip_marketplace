class RemovePhoneNumberFromEnquiries < ActiveRecord::Migration[7.0]
  def change
    remove_column :enquiries, :phone_number, :string
  end
end
