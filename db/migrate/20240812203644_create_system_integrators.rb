class CreateSystemIntegrators < ActiveRecord::Migration[7.0]
  def change
    create_table :system_integrators do |t|
      t.string :name
      t.text :desc
      t.text :image_data
      t.date :partnership_validity
      t.references :si_partnership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
