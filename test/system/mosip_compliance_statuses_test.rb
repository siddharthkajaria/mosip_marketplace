require "application_system_test_case"

class MosipComplianceStatusesTest < ApplicationSystemTestCase
  setup do
    @mosip_compliance_status = mosip_compliance_statuses(:one)
  end

  test "visiting the index" do
    visit mosip_compliance_statuses_url
    assert_selector "h1", text: "Mosip compliance statuses"
  end

  test "should create mosip compliance status" do
    visit mosip_compliance_statuses_url
    click_on "New mosip compliance status"

    fill_in "Desc", with: @mosip_compliance_status.desc
    check "Is active" if @mosip_compliance_status.is_active
    fill_in "Name", with: @mosip_compliance_status.name
    click_on "Create Mosip compliance status"

    assert_text "Mosip compliance status was successfully created"
    click_on "Back"
  end

  test "should update Mosip compliance status" do
    visit mosip_compliance_status_url(@mosip_compliance_status)
    click_on "Edit this mosip compliance status", match: :first

    fill_in "Desc", with: @mosip_compliance_status.desc
    check "Is active" if @mosip_compliance_status.is_active
    fill_in "Name", with: @mosip_compliance_status.name
    click_on "Update Mosip compliance status"

    assert_text "Mosip compliance status was successfully updated"
    click_on "Back"
  end

  test "should destroy Mosip compliance status" do
    visit mosip_compliance_status_url(@mosip_compliance_status)
    click_on "Destroy this mosip compliance status", match: :first

    assert_text "Mosip compliance status was successfully destroyed"
  end
end
