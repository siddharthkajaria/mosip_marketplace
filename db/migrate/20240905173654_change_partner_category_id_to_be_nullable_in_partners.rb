class ChangePartnerCategoryIdToBeNullableInPartners < ActiveRecord::Migration[7.0]
  def change
    change_column_null :partners, :partner_category_id, true
  end
end
