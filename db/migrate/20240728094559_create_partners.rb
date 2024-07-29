class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.text :desc
      t.text :image_data
      t.integer :position
      t.text :url

      t.timestamps
    end
  end
end
