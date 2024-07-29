require "test_helper"

class BiometricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @biometric = biometrics(:one)
  end

  test "should get index" do
    get biometrics_url
    assert_response :success
  end

  test "should get new" do
    get new_biometric_url
    assert_response :success
  end

  test "should create biometric" do
    assert_difference("Biometric.count") do
      post biometrics_url, params: { biometric: { code: @biometric.code, desc: @biometric.desc, name: @biometric.name } }
    end

    assert_redirected_to biometric_url(Biometric.last)
  end

  test "should show biometric" do
    get biometric_url(@biometric)
    assert_response :success
  end

  test "should get edit" do
    get edit_biometric_url(@biometric)
    assert_response :success
  end

  test "should update biometric" do
    patch biometric_url(@biometric), params: { biometric: { code: @biometric.code, desc: @biometric.desc, name: @biometric.name } }
    assert_redirected_to biometric_url(@biometric)
  end

  test "should destroy biometric" do
    assert_difference("Biometric.count", -1) do
      delete biometric_url(@biometric)
    end

    assert_redirected_to biometrics_url
  end
end
