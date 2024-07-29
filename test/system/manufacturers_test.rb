require "application_system_test_case"

class ManufacturersTest < ApplicationSystemTestCase
  setup do
    @manufacturer = manufacturers(:one)
  end

  test "visiting the index" do
    visit manufacturers_url
    assert_selector "h1", text: "Manufacturers"
  end

  test "should create manufacturer" do
    visit manufacturers_url
    click_on "New manufacturer"

    fill_in "Address", with: @manufacturer.address
    fill_in "Desc", with: @manufacturer.desc
    fill_in "Email one", with: @manufacturer.email_one
    fill_in "Email three", with: @manufacturer.email_three
    fill_in "Email two", with: @manufacturer.email_two
    fill_in "Image data", with: @manufacturer.image_data
    fill_in "Name", with: @manufacturer.name
    fill_in "Phone one", with: @manufacturer.phone_one
    fill_in "Phone three", with: @manufacturer.phone_three
    fill_in "Phone two", with: @manufacturer.phone_two
    fill_in "Website link", with: @manufacturer.website_link
    click_on "Create Manufacturer"

    assert_text "Manufacturer was successfully created"
    click_on "Back"
  end

  test "should update Manufacturer" do
    visit manufacturer_url(@manufacturer)
    click_on "Edit this manufacturer", match: :first

    fill_in "Address", with: @manufacturer.address
    fill_in "Desc", with: @manufacturer.desc
    fill_in "Email one", with: @manufacturer.email_one
    fill_in "Email three", with: @manufacturer.email_three
    fill_in "Email two", with: @manufacturer.email_two
    fill_in "Image data", with: @manufacturer.image_data
    fill_in "Name", with: @manufacturer.name
    fill_in "Phone one", with: @manufacturer.phone_one
    fill_in "Phone three", with: @manufacturer.phone_three
    fill_in "Phone two", with: @manufacturer.phone_two
    fill_in "Website link", with: @manufacturer.website_link
    click_on "Update Manufacturer"

    assert_text "Manufacturer was successfully updated"
    click_on "Back"
  end

  test "should destroy Manufacturer" do
    visit manufacturer_url(@manufacturer)
    click_on "Destroy this manufacturer", match: :first

    assert_text "Manufacturer was successfully destroyed"
  end
end
