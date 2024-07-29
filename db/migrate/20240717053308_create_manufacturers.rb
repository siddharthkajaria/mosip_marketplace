class CreateManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :email_one
      t.string :email_two
      t.string :email_three
      t.string :phone_one
      t.string :phone_two
      t.string :phone_three
      t.text :address
      t.text :desc
      t.string :website_link
      t.text :image_data

      t.timestamps
    end
  end
end
