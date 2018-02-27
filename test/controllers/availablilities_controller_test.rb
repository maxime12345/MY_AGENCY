require 'test_helper'

class AvailablilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get availablilities_index_url
    assert_response :success
  end

  test "should get show" do
    get availablilities_show_url
    assert_response :success
  end

  test "should get edit" do
    get availablilities_edit_url
    assert_response :success
  end

  test "should get update" do
    get availablilities_update_url
    assert_response :success
  end

  test "should get new" do
    get availablilities_new_url
    assert_response :success
  end

  test "should get create" do
    get availablilities_create_url
    assert_response :success
  end

  test "should get destroy" do
    get availablilities_destroy_url
    assert_response :success
  end

end
