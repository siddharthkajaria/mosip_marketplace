require "test_helper"

class Admin::SiPartnershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_si_partnership = admin_si_partnerships(:one)
  end

  test "should get index" do
    get admin_si_partnerships_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_si_partnership_url
    assert_response :success
  end

  test "should create admin_si_partnership" do
    assert_difference("Admin::SiPartnership.count") do
      post admin_si_partnerships_url, params: { admin_si_partnership: {  } }
    end

    assert_redirected_to admin_si_partnership_url(Admin::SiPartnership.last)
  end

  test "should show admin_si_partnership" do
    get admin_si_partnership_url(@admin_si_partnership)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_si_partnership_url(@admin_si_partnership)
    assert_response :success
  end

  test "should update admin_si_partnership" do
    patch admin_si_partnership_url(@admin_si_partnership), params: { admin_si_partnership: {  } }
    assert_redirected_to admin_si_partnership_url(@admin_si_partnership)
  end

  test "should destroy admin_si_partnership" do
    assert_difference("Admin::SiPartnership.count", -1) do
      delete admin_si_partnership_url(@admin_si_partnership)
    end

    assert_redirected_to admin_si_partnerships_url
  end
end
