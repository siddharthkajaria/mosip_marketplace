class CreateJoinTableProductsBiometrics < ActiveRecord::Migration[7.0]
  def change
    create_join_table :products, :biometrics do |t|
      t.index [:product_id, :biometric_id]
      t.index [:biometric_id, :product_id]
    end
  end
end
