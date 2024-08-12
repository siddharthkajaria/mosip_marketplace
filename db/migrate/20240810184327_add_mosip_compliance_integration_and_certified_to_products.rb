class AddMosipComplianceIntegrationAndCertifiedToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :mosip_compliance, :string
    add_column :products, :mosip_integration, :string
    add_column :products, :certified, :boolean, default: false
  end
end
