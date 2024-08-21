require "test_helper"

class Admin::FtmCertificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ftm_certifications_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_ftm_certifications_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_ftm_certifications_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_ftm_certifications_edit_url
    assert_response :success
  end
end
