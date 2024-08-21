require "application_system_test_case"

class Admin::ManufacturersTest < ApplicationSystemTestCase
  setup do
    @admin_manufacturer = admin_manufacturers(:one)
  end

  test "visiting the index" do
    visit admin_manufacturers_url
    assert_selector "h1", text: "Manufacturers"
  end

  test "should create manufacturer" do
    visit admin_manufacturers_url
    click_on "New manufacturer"

    fill_in "Address1", with: @admin_manufacturer.address1
    fill_in "Address2", with: @admin_manufacturer.address2
    fill_in "Address3", with: @admin_manufacturer.address3
    fill_in "Desc", with: @admin_manufacturer.desc
    fill_in "Email one", with: @admin_manufacturer.email_one
    fill_in "Email three", with: @admin_manufacturer.email_three
    fill_in "Email two", with: @admin_manufacturer.email_two
    fill_in "Image data", with: @admin_manufacturer.image_data
    fill_in "Name", with: @admin_manufacturer.name
    fill_in "Phone one", with: @admin_manufacturer.phone_one
    fill_in "Phone three", with: @admin_manufacturer.phone_three
    fill_in "Phone two", with: @admin_manufacturer.phone_two
    fill_in "Website link", with: @admin_manufacturer.website_link
    click_on "Create Manufacturer"

    assert_text "Manufacturer was successfully created"
    click_on "Back"
  end

  test "should update Manufacturer" do
    visit admin_manufacturer_url(@admin_manufacturer)
    click_on "Edit this manufacturer", match: :first

    fill_in "Address1", with: @admin_manufacturer.address1
    fill_in "Address2", with: @admin_manufacturer.address2
    fill_in "Address3", with: @admin_manufacturer.address3
    fill_in "Desc", with: @admin_manufacturer.desc
    fill_in "Email one", with: @admin_manufacturer.email_one
    fill_in "Email three", with: @admin_manufacturer.email_three
    fill_in "Email two", with: @admin_manufacturer.email_two
    fill_in "Image data", with: @admin_manufacturer.image_data
    fill_in "Name", with: @admin_manufacturer.name
    fill_in "Phone one", with: @admin_manufacturer.phone_one
    fill_in "Phone three", with: @admin_manufacturer.phone_three
    fill_in "Phone two", with: @admin_manufacturer.phone_two
    fill_in "Website link", with: @admin_manufacturer.website_link
    click_on "Update Manufacturer"

    assert_text "Manufacturer was successfully updated"
    click_on "Back"
  end

  test "should destroy Manufacturer" do
    visit admin_manufacturer_url(@admin_manufacturer)
    click_on "Destroy this manufacturer", match: :first

    assert_text "Manufacturer was successfully destroyed"
  end
end
