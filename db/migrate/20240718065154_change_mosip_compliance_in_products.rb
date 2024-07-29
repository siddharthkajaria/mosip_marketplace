class ChangeMosipComplianceInProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :mosip_compliance, :boolean
    add_reference :products, :mosip_compliance_status, foreign_key: true
  end
end
