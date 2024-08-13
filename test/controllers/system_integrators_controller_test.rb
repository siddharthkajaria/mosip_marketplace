require "test_helper"

class SystemIntegratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @system_integrator = system_integrators(:one)
  end

  test "should get index" do
    get system_integrators_url
    assert_response :success
  end

  test "should get new" do
    get new_system_integrator_url
    assert_response :success
  end

  test "should create system_integrator" do
    assert_difference("SystemIntegrator.count") do
      post system_integrators_url, params: { system_integrator: { desc: @system_integrator.desc, image_data: @system_integrator.image_data, name: @system_integrator.name, partnership_validity: @system_integrator.partnership_validity, si_partnership_id: @system_integrator.si_partnership_id } }
    end

    assert_redirected_to system_integrator_url(SystemIntegrator.last)
  end

  test "should show system_integrator" do
    get system_integrator_url(@system_integrator)
    assert_response :success
  end

  test "should get edit" do
    get edit_system_integrator_url(@system_integrator)
    assert_response :success
  end

  test "should update system_integrator" do
    patch system_integrator_url(@system_integrator), params: { system_integrator: { desc: @system_integrator.desc, image_data: @system_integrator.image_data, name: @system_integrator.name, partnership_validity: @system_integrator.partnership_validity, si_partnership_id: @system_integrator.si_partnership_id } }
    assert_redirected_to system_integrator_url(@system_integrator)
  end

  test "should destroy system_integrator" do
    assert_difference("SystemIntegrator.count", -1) do
      delete system_integrator_url(@system_integrator)
    end

    assert_redirected_to system_integrators_url
  end
end
