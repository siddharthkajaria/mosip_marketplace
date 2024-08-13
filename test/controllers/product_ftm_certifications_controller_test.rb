require "test_helper"

class ProductFtmCertificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_ftm_certification = product_ftm_certifications(:one)
  end

  test "should get index" do
    get product_ftm_certifications_url
    assert_response :success
  end

  test "should get new" do
    get new_product_ftm_certification_url
    assert_response :success
  end

  test "should create product_ftm_certification" do
    assert_difference("ProductFtmCertification.count") do
      post product_ftm_certifications_url, params: { product_ftm_certification: { code: @product_ftm_certification.code, desc: @product_ftm_certification.desc, name: @product_ftm_certification.name, status: @product_ftm_certification.status } }
    end

    assert_redirected_to product_ftm_certification_url(ProductFtmCertification.last)
  end

  test "should show product_ftm_certification" do
    get product_ftm_certification_url(@product_ftm_certification)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_ftm_certification_url(@product_ftm_certification)
    assert_response :success
  end

  test "should update product_ftm_certification" do
    patch product_ftm_certification_url(@product_ftm_certification), params: { product_ftm_certification: { code: @product_ftm_certification.code, desc: @product_ftm_certification.desc, name: @product_ftm_certification.name, status: @product_ftm_certification.status } }
    assert_redirected_to product_ftm_certification_url(@product_ftm_certification)
  end

  test "should destroy product_ftm_certification" do
    assert_difference("ProductFtmCertification.count", -1) do
      delete product_ftm_certification_url(@product_ftm_certification)
    end

    assert_redirected_to product_ftm_certifications_url
  end
end
