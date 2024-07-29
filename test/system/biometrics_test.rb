require "application_system_test_case"

class BiometricsTest < ApplicationSystemTestCase
  setup do
    @biometric = biometrics(:one)
  end

  test "visiting the index" do
    visit biometrics_url
    assert_selector "h1", text: "Biometrics"
  end

  test "should create biometric" do
    visit biometrics_url
    click_on "New biometric"

    fill_in "Code", with: @biometric.code
    fill_in "Desc", with: @biometric.desc
    fill_in "Name", with: @biometric.name
    click_on "Create Biometric"

    assert_text "Biometric was successfully created"
    click_on "Back"
  end

  test "should update Biometric" do
    visit biometric_url(@biometric)
    click_on "Edit this biometric", match: :first

    fill_in "Code", with: @biometric.code
    fill_in "Desc", with: @biometric.desc
    fill_in "Name", with: @biometric.name
    click_on "Update Biometric"

    assert_text "Biometric was successfully updated"
    click_on "Back"
  end

  test "should destroy Biometric" do
    visit biometric_url(@biometric)
    click_on "Destroy this biometric", match: :first

    assert_text "Biometric was successfully destroyed"
  end
end
