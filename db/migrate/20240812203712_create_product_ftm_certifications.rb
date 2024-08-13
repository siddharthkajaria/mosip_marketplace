class CreateProductFtmCertifications < ActiveRecord::Migration[7.0]
  def change
    create_table :product_ftm_certifications do |t|
      t.string :name
      t.text :desc
      t.string :code
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
