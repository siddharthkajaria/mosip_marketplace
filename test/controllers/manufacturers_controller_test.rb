require "test_helper"

class ManufacturersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manufacturer = manufacturers(:one)
  end

  test "should get index" do
    get manufacturers_url
    assert_response :success
  end

  test "should get new" do
    get new_manufacturer_url
    assert_response :success
  end

  test "should create manufacturer" do
    assert_difference("Manufacturer.count") do
      post manufacturers_url, params: { manufacturer: { address: @manufacturer.address, desc: @manufacturer.desc, email_one: @manufacturer.email_one, email_three: @manufacturer.email_three, email_two: @manufacturer.email_two, image_data: @manufacturer.image_data, name: @manufacturer.name, phone_one: @manufacturer.phone_one, phone_three: @manufacturer.phone_three, phone_two: @manufacturer.phone_two, website_link: @manufacturer.website_link } }
    end

    assert_redirected_to manufacturer_url(Manufacturer.last)
  end

  test "should show manufacturer" do
    get manufacturer_url(@manufacturer)
    assert_response :success
  end

  test "should get edit" do
    get edit_manufacturer_url(@manufacturer)
    assert_response :success
  end

  test "should update manufacturer" do
    patch manufacturer_url(@manufacturer), params: { manufacturer: { address: @manufacturer.address, desc: @manufacturer.desc, email_one: @manufacturer.email_one, email_three: @manufacturer.email_three, email_two: @manufacturer.email_two, image_data: @manufacturer.image_data, name: @manufacturer.name, phone_one: @manufacturer.phone_one, phone_three: @manufacturer.phone_three, phone_two: @manufacturer.phone_two, website_link: @manufacturer.website_link } }
    assert_redirected_to manufacturer_url(@manufacturer)
  end

  test "should destroy manufacturer" do
    assert_difference("Manufacturer.count", -1) do
      delete manufacturer_url(@manufacturer)
    end

    assert_redirected_to manufacturers_url
  end
end
