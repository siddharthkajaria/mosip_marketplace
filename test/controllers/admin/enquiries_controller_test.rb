require "test_helper"

class Admin::EnquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_enquiries_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_enquiries_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_enquiries_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_enquiries_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_enquiries_destroy_url
    assert_response :success
  end
end
