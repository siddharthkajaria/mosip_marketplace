class ChangeStatusToBooleanInProductImages < ActiveRecord::Migration[7.0]
  def change
    change_column :product_images, :status, :boolean, default: false
  end
end
