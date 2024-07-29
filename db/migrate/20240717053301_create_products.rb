class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :short_description
      t.references :manufacturer, null: false, foreign_key: true
      t.string :model
      t.string :supported_biometric_modalities
      t.text :additional_components
      t.boolean :mosip_compliance
      t.string :macp_certification_link
      t.string :sbi_version
      t.text :global_certifications
      t.string :ftm_certification
      t.string :ftm_chip_make_and_model
      t.string :firmware_version
      t.string :software_version
      t.text :full_specifications
      t.text :usage
      t.string :print_software_version
      t.text :integration_methodology
      t.references :category, null: false, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
