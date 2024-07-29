class CreateMosipComplianceStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :mosip_compliance_statuses do |t|
      t.string :name
      t.text :desc
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
