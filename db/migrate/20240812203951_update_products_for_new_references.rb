class UpdateProductsForNewReferences < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :ftm_certification, :string
    add_reference :products, :product_ftm_certification, foreign_key: true
    add_reference :products, :product_specification_version, foreign_key: true
  end
end
