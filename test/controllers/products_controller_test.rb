require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { additional_components: @product.additional_components, category_id: @product.category_id, firmware_version: @product.firmware_version, ftm_certification: @product.ftm_certification, ftm_chip_make_and_model: @product.ftm_chip_make_and_model, full_specifications: @product.full_specifications, global_certifications: @product.global_certifications, image_data: @product.image_data, integration_methodology: @product.integration_methodology, macp_certification_link: @product.macp_certification_link, manufacturer_id: @product.manufacturer_id, model: @product.model, mosip_compliance: @product.mosip_compliance, name: @product.name, print_software_version: @product.print_software_version, sbi_version: @product.sbi_version, short_description: @product.short_description, software_version: @product.software_version, supported_biometric_modalities: @product.supported_biometric_modalities, usage: @product.usage } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { additional_components: @product.additional_components, category_id: @product.category_id, firmware_version: @product.firmware_version, ftm_certification: @product.ftm_certification, ftm_chip_make_and_model: @product.ftm_chip_make_and_model, full_specifications: @product.full_specifications, global_certifications: @product.global_certifications, image_data: @product.image_data, integration_methodology: @product.integration_methodology, macp_certification_link: @product.macp_certification_link, manufacturer_id: @product.manufacturer_id, model: @product.model, mosip_compliance: @product.mosip_compliance, name: @product.name, print_software_version: @product.print_software_version, sbi_version: @product.sbi_version, short_description: @product.short_description, software_version: @product.software_version, supported_biometric_modalities: @product.supported_biometric_modalities, usage: @product.usage } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
