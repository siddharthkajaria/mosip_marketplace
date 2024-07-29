class CreatePartnerCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :partner_categories do |t|
      t.string :name
      t.text :desc
      t.text :image_data

      t.timestamps
    end
  end
end
