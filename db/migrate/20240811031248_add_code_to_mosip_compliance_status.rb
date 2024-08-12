class AddCodeToMosipComplianceStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :mosip_compliance_statuses, :code, :string
  end
end
