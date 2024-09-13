require "application_system_test_case"

class Admin::SiPartnershipsTest < ApplicationSystemTestCase
  setup do
    @admin_si_partnership = admin_si_partnerships(:one)
  end

  test "visiting the index" do
    visit admin_si_partnerships_url
    assert_selector "h1", text: "Si partnerships"
  end

  test "should create si partnership" do
    visit admin_si_partnerships_url
    click_on "New si partnership"

    click_on "Create Si partnership"

    assert_text "Si partnership was successfully created"
    click_on "Back"
  end

  test "should update Si partnership" do
    visit admin_si_partnership_url(@admin_si_partnership)
    click_on "Edit this si partnership", match: :first

    click_on "Update Si partnership"

    assert_text "Si partnership was successfully updated"
    click_on "Back"
  end

  test "should destroy Si partnership" do
    visit admin_si_partnership_url(@admin_si_partnership)
    click_on "Destroy this si partnership", match: :first

    assert_text "Si partnership was successfully destroyed"
  end
end
