require "test_helper"

class Admin::ManufacturersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_manufacturer = admin_manufacturers(:one)
  end

  test "should get index" do
    get admin_manufacturers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_manufacturer_url
    assert_response :success
  end

  test "should create admin_manufacturer" do
    assert_difference("Admin::Manufacturer.count") do
      post admin_manufacturers_url, params: { admin_manufacturer: { address1: @admin_manufacturer.address1, address2: @admin_manufacturer.address2, address3: @admin_manufacturer.address3, desc: @admin_manufacturer.desc, email_one: @admin_manufacturer.email_one, email_three: @admin_manufacturer.email_three, email_two: @admin_manufacturer.email_two, image_data: @admin_manufacturer.image_data, name: @admin_manufacturer.name, phone_one: @admin_manufacturer.phone_one, phone_three: @admin_manufacturer.phone_three, phone_two: @admin_manufacturer.phone_two, website_link: @admin_manufacturer.website_link } }
    end

    assert_redirected_to admin_manufacturer_url(Admin::Manufacturer.last)
  end

  test "should show admin_manufacturer" do
    get admin_manufacturer_url(@admin_manufacturer)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_manufacturer_url(@admin_manufacturer)
    assert_response :success
  end

  test "should update admin_manufacturer" do
    patch admin_manufacturer_url(@admin_manufacturer), params: { admin_manufacturer: { address1: @admin_manufacturer.address1, address2: @admin_manufacturer.address2, address3: @admin_manufacturer.address3, desc: @admin_manufacturer.desc, email_one: @admin_manufacturer.email_one, email_three: @admin_manufacturer.email_three, email_two: @admin_manufacturer.email_two, image_data: @admin_manufacturer.image_data, name: @admin_manufacturer.name, phone_one: @admin_manufacturer.phone_one, phone_three: @admin_manufacturer.phone_three, phone_two: @admin_manufacturer.phone_two, website_link: @admin_manufacturer.website_link } }
    assert_redirected_to admin_manufacturer_url(@admin_manufacturer)
  end

  test "should destroy admin_manufacturer" do
    assert_difference("Admin::Manufacturer.count", -1) do
      delete admin_manufacturer_url(@admin_manufacturer)
    end

    assert_redirected_to admin_manufacturers_url
  end
end
