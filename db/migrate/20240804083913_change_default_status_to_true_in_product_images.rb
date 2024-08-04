class ChangeDefaultStatusToTrueInProductImages < ActiveRecord::Migration[7.0]
  def change
    change_column_default :product_images, :status, from: false, to: true
  end
end
