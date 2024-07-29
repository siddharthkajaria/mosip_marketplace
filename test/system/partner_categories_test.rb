require "application_system_test_case"

class PartnerCategoriesTest < ApplicationSystemTestCase
  setup do
    @partner_category = partner_categories(:one)
  end

  test "visiting the index" do
    visit partner_categories_url
    assert_selector "h1", text: "Partner categories"
  end

  test "should create partner category" do
    visit partner_categories_url
    click_on "New partner category"

    fill_in "Desc", with: @partner_category.desc
    fill_in "Image data", with: @partner_category.image_data
    fill_in "Name", with: @partner_category.name
    click_on "Create Partner category"

    assert_text "Partner category was successfully created"
    click_on "Back"
  end

  test "should update Partner category" do
    visit partner_category_url(@partner_category)
    click_on "Edit this partner category", match: :first

    fill_in "Desc", with: @partner_category.desc
    fill_in "Image data", with: @partner_category.image_data
    fill_in "Name", with: @partner_category.name
    click_on "Update Partner category"

    assert_text "Partner category was successfully updated"
    click_on "Back"
  end

  test "should destroy Partner category" do
    visit partner_category_url(@partner_category)
    click_on "Destroy this partner category", match: :first

    assert_text "Partner category was successfully destroyed"
  end
end
