require "test_helper"

class ProductSpecificationVersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_specification_version = product_specification_versions(:one)
  end

  test "should get index" do
    get product_specification_versions_url
    assert_response :success
  end

  test "should get new" do
    get new_product_specification_version_url
    assert_response :success
  end

  test "should create product_specification_version" do
    assert_difference("ProductSpecificationVersion.count") do
      post product_specification_versions_url, params: { product_specification_version: { code: @product_specification_version.code, desc: @product_specification_version.desc, name: @product_specification_version.name, status: @product_specification_version.status } }
    end

    assert_redirected_to product_specification_version_url(ProductSpecificationVersion.last)
  end

  test "should show product_specification_version" do
    get product_specification_version_url(@product_specification_version)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_specification_version_url(@product_specification_version)
    assert_response :success
  end

  test "should update product_specification_version" do
    patch product_specification_version_url(@product_specification_version), params: { product_specification_version: { code: @product_specification_version.code, desc: @product_specification_version.desc, name: @product_specification_version.name, status: @product_specification_version.status } }
    assert_redirected_to product_specification_version_url(@product_specification_version)
  end

  test "should destroy product_specification_version" do
    assert_difference("ProductSpecificationVersion.count", -1) do
      delete product_specification_version_url(@product_specification_version)
    end

    assert_redirected_to product_specification_versions_url
  end
end
