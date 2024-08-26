class AddDesignationOrganisationToEnquiry < ActiveRecord::Migration[7.0]
  def change
    add_column :enquiries, :designation, :string
    add_column :enquiries, :organisation, :string
    add_column :enquiries, :subject, :string
  end
end
