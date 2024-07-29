class CreateBiometrics < ActiveRecord::Migration[7.0]
  def change
    create_table :biometrics do |t|
      t.string :name
      t.text :desc
      t.string :code

      t.timestamps
    end
  end
end
