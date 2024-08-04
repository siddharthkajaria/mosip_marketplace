class RenameImageDataToImagesDataInProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :image_data, :images_data
  end
end
