require "application_system_test_case"

class ProductFtmCertificationsTest < ApplicationSystemTestCase
  setup do
    @product_ftm_certification = product_ftm_certifications(:one)
  end

  test "visiting the index" do
    visit product_ftm_certifications_url
    assert_selector "h1", text: "Product ftm certifications"
  end

  test "should create product ftm certification" do
    visit product_ftm_certifications_url
    click_on "New product ftm certification"

    fill_in "Code", with: @product_ftm_certification.code
    fill_in "Desc", with: @product_ftm_certification.desc
    fill_in "Name", with: @product_ftm_certification.name
    check "Status" if @product_ftm_certification.status
    click_on "Create Product ftm certification"

    assert_text "Product ftm certification was successfully created"
    click_on "Back"
  end

  test "should update Product ftm certification" do
    visit product_ftm_certification_url(@product_ftm_certification)
    click_on "Edit this product ftm certification", match: :first

    fill_in "Code", with: @product_ftm_certification.code
    fill_in "Desc", with: @product_ftm_certification.desc
    fill_in "Name", with: @product_ftm_certification.name
    check "Status" if @product_ftm_certification.status
    click_on "Update Product ftm certification"

    assert_text "Product ftm certification was successfully updated"
    click_on "Back"
  end

  test "should destroy Product ftm certification" do
    visit product_ftm_certification_url(@product_ftm_certification)
    click_on "Destroy this product ftm certification", match: :first

    assert_text "Product ftm certification was successfully destroyed"
  end
end
