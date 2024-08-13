require "application_system_test_case"

class ProductSpecificationVersionsTest < ApplicationSystemTestCase
  setup do
    @product_specification_version = product_specification_versions(:one)
  end

  test "visiting the index" do
    visit product_specification_versions_url
    assert_selector "h1", text: "Product specification versions"
  end

  test "should create product specification version" do
    visit product_specification_versions_url
    click_on "New product specification version"

    fill_in "Code", with: @product_specification_version.code
    fill_in "Desc", with: @product_specification_version.desc
    fill_in "Name", with: @product_specification_version.name
    check "Status" if @product_specification_version.status
    click_on "Create Product specification version"

    assert_text "Product specification version was successfully created"
    click_on "Back"
  end

  test "should update Product specification version" do
    visit product_specification_version_url(@product_specification_version)
    click_on "Edit this product specification version", match: :first

    fill_in "Code", with: @product_specification_version.code
    fill_in "Desc", with: @product_specification_version.desc
    fill_in "Name", with: @product_specification_version.name
    check "Status" if @product_specification_version.status
    click_on "Update Product specification version"

    assert_text "Product specification version was successfully updated"
    click_on "Back"
  end

  test "should destroy Product specification version" do
    visit product_specification_version_url(@product_specification_version)
    click_on "Destroy this product specification version", match: :first

    assert_text "Product specification version was successfully destroyed"
  end
end
