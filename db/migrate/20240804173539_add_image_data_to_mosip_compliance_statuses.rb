class AddImageDataToMosipComplianceStatuses < ActiveRecord::Migration[7.0]
  def change
    add_column :mosip_compliance_statuses, :image_data, :text
  end
end
