class CreateProductImages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_images do |t|
      t.text :image_data
      t.integer :position
      t.string :status
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
