require "application_system_test_case"

class SiPartnershipsTest < ApplicationSystemTestCase
  setup do
    @si_partnership = si_partnerships(:one)
  end

  test "visiting the index" do
    visit si_partnerships_url
    assert_selector "h1", text: "Si partnerships"
  end

  test "should create si partnership" do
    visit si_partnerships_url
    click_on "New si partnership"

    fill_in "Code", with: @si_partnership.code
    fill_in "Desc", with: @si_partnership.desc
    fill_in "Name", with: @si_partnership.name
    check "Status" if @si_partnership.status
    click_on "Create Si partnership"

    assert_text "Si partnership was successfully created"
    click_on "Back"
  end

  test "should update Si partnership" do
    visit si_partnership_url(@si_partnership)
    click_on "Edit this si partnership", match: :first

    fill_in "Code", with: @si_partnership.code
    fill_in "Desc", with: @si_partnership.desc
    fill_in "Name", with: @si_partnership.name
    check "Status" if @si_partnership.status
    click_on "Update Si partnership"

    assert_text "Si partnership was successfully updated"
    click_on "Back"
  end

  test "should destroy Si partnership" do
    visit si_partnership_url(@si_partnership)
    click_on "Destroy this si partnership", match: :first

    assert_text "Si partnership was successfully destroyed"
  end
end
