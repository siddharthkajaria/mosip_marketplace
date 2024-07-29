require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "Additional components", with: @product.additional_components
    fill_in "Category", with: @product.category_id
    fill_in "Firmware version", with: @product.firmware_version
    fill_in "Ftm certification", with: @product.ftm_certification
    fill_in "Ftm chip make and model", with: @product.ftm_chip_make_and_model
    fill_in "Full specifications", with: @product.full_specifications
    fill_in "Global certifications", with: @product.global_certifications
    fill_in "Image data", with: @product.image_data
    fill_in "Integration methodology", with: @product.integration_methodology
    fill_in "Macp certification link", with: @product.macp_certification_link
    fill_in "Manufacturer", with: @product.manufacturer_id
    fill_in "Model", with: @product.model
    check "Mosip compliance" if @product.mosip_compliance
    fill_in "Name", with: @product.name
    fill_in "Print software version", with: @product.print_software_version
    fill_in "Sbi version", with: @product.sbi_version
    fill_in "Short description", with: @product.short_description
    fill_in "Software version", with: @product.software_version
    fill_in "Supported biometric modalities", with: @product.supported_biometric_modalities
    fill_in "Usage", with: @product.usage
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "Additional components", with: @product.additional_components
    fill_in "Category", with: @product.category_id
    fill_in "Firmware version", with: @product.firmware_version
    fill_in "Ftm certification", with: @product.ftm_certification
    fill_in "Ftm chip make and model", with: @product.ftm_chip_make_and_model
    fill_in "Full specifications", with: @product.full_specifications
    fill_in "Global certifications", with: @product.global_certifications
    fill_in "Image data", with: @product.image_data
    fill_in "Integration methodology", with: @product.integration_methodology
    fill_in "Macp certification link", with: @product.macp_certification_link
    fill_in "Manufacturer", with: @product.manufacturer_id
    fill_in "Model", with: @product.model
    check "Mosip compliance" if @product.mosip_compliance
    fill_in "Name", with: @product.name
    fill_in "Print software version", with: @product.print_software_version
    fill_in "Sbi version", with: @product.sbi_version
    fill_in "Short description", with: @product.short_description
    fill_in "Software version", with: @product.software_version
    fill_in "Supported biometric modalities", with: @product.supported_biometric_modalities
    fill_in "Usage", with: @product.usage
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
