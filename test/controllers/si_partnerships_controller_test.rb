require "test_helper"

class SiPartnershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @si_partnership = si_partnerships(:one)
  end

  test "should get index" do
    get si_partnerships_url
    assert_response :success
  end

  test "should get new" do
    get new_si_partnership_url
    assert_response :success
  end

  test "should create si_partnership" do
    assert_difference("SiPartnership.count") do
      post si_partnerships_url, params: { si_partnership: { code: @si_partnership.code, desc: @si_partnership.desc, name: @si_partnership.name, status: @si_partnership.status } }
    end

    assert_redirected_to si_partnership_url(SiPartnership.last)
  end

  test "should show si_partnership" do
    get si_partnership_url(@si_partnership)
    assert_response :success
  end

  test "should get edit" do
    get edit_si_partnership_url(@si_partnership)
    assert_response :success
  end

  test "should update si_partnership" do
    patch si_partnership_url(@si_partnership), params: { si_partnership: { code: @si_partnership.code, desc: @si_partnership.desc, name: @si_partnership.name, status: @si_partnership.status } }
    assert_redirected_to si_partnership_url(@si_partnership)
  end

  test "should destroy si_partnership" do
    assert_difference("SiPartnership.count", -1) do
      delete si_partnership_url(@si_partnership)
    end

    assert_redirected_to si_partnerships_url
  end
end
