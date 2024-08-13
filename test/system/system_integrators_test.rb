require "application_system_test_case"

class SystemIntegratorsTest < ApplicationSystemTestCase
  setup do
    @system_integrator = system_integrators(:one)
  end

  test "visiting the index" do
    visit system_integrators_url
    assert_selector "h1", text: "System integrators"
  end

  test "should create system integrator" do
    visit system_integrators_url
    click_on "New system integrator"

    fill_in "Desc", with: @system_integrator.desc
    fill_in "Image data", with: @system_integrator.image_data
    fill_in "Name", with: @system_integrator.name
    fill_in "Partnership validity", with: @system_integrator.partnership_validity
    fill_in "Si partnership", with: @system_integrator.si_partnership_id
    click_on "Create System integrator"

    assert_text "System integrator was successfully created"
    click_on "Back"
  end

  test "should update System integrator" do
    visit system_integrator_url(@system_integrator)
    click_on "Edit this system integrator", match: :first

    fill_in "Desc", with: @system_integrator.desc
    fill_in "Image data", with: @system_integrator.image_data
    fill_in "Name", with: @system_integrator.name
    fill_in "Partnership validity", with: @system_integrator.partnership_validity
    fill_in "Si partnership", with: @system_integrator.si_partnership_id
    click_on "Update System integrator"

    assert_text "System integrator was successfully updated"
    click_on "Back"
  end

  test "should destroy System integrator" do
    visit system_integrator_url(@system_integrator)
    click_on "Destroy this system integrator", match: :first

    assert_text "System integrator was successfully destroyed"
  end
end
