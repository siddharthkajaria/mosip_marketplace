require "application_system_test_case"

class EnquiriesTest < ApplicationSystemTestCase
  setup do
    @enquiry = enquiries(:one)
  end

  test "visiting the index" do
    visit enquiries_url
    assert_selector "h1", text: "Enquiries"
  end

  test "should create enquiry" do
    visit enquiries_url
    click_on "New enquiry"

    fill_in "Email", with: @enquiry.email
    fill_in "Enquiry type", with: @enquiry.enquiry_type
    fill_in "Name", with: @enquiry.name
    fill_in "Phone number", with: @enquiry.phone_number
    click_on "Create Enquiry"

    assert_text "Enquiry was successfully created"
    click_on "Back"
  end

  test "should update Enquiry" do
    visit enquiry_url(@enquiry)
    click_on "Edit this enquiry", match: :first

    fill_in "Email", with: @enquiry.email
    fill_in "Enquiry type", with: @enquiry.enquiry_type
    fill_in "Name", with: @enquiry.name
    fill_in "Phone number", with: @enquiry.phone_number
    click_on "Update Enquiry"

    assert_text "Enquiry was successfully updated"
    click_on "Back"
  end

  test "should destroy Enquiry" do
    visit enquiry_url(@enquiry)
    click_on "Destroy this enquiry", match: :first

    assert_text "Enquiry was successfully destroyed"
  end
end
