class RemoveImagesDataFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :images_data, :text
  end
end
