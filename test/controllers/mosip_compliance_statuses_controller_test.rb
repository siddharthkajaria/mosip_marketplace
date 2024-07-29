require "test_helper"

class MosipComplianceStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mosip_compliance_status = mosip_compliance_statuses(:one)
  end

  test "should get index" do
    get mosip_compliance_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_mosip_compliance_status_url
    assert_response :success
  end

  test "should create mosip_compliance_status" do
    assert_difference("MosipComplianceStatus.count") do
      post mosip_compliance_statuses_url, params: { mosip_compliance_status: { desc: @mosip_compliance_status.desc, is_active: @mosip_compliance_status.is_active, name: @mosip_compliance_status.name } }
    end

    assert_redirected_to mosip_compliance_status_url(MosipComplianceStatus.last)
  end

  test "should show mosip_compliance_status" do
    get mosip_compliance_status_url(@mosip_compliance_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_mosip_compliance_status_url(@mosip_compliance_status)
    assert_response :success
  end

  test "should update mosip_compliance_status" do
    patch mosip_compliance_status_url(@mosip_compliance_status), params: { mosip_compliance_status: { desc: @mosip_compliance_status.desc, is_active: @mosip_compliance_status.is_active, name: @mosip_compliance_status.name } }
    assert_redirected_to mosip_compliance_status_url(@mosip_compliance_status)
  end

  test "should destroy mosip_compliance_status" do
    assert_difference("MosipComplianceStatus.count", -1) do
      delete mosip_compliance_status_url(@mosip_compliance_status)
    end

    assert_redirected_to mosip_compliance_statuses_url
  end
end
