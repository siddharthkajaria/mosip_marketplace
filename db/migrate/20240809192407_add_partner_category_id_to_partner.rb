class AddPartnerCategoryIdToPartner < ActiveRecord::Migration[7.0]
  def change
    add_reference :partners, :partner_category, null: false, foreign_key: true
  end
end
