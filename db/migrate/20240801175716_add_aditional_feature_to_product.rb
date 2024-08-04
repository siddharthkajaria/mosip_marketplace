class AddAditionalFeatureToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :additional_feature, :text
  end
end
