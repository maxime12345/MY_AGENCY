require 'test_helper'

class ProfilsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get profils_edit_url
    assert_response :success
  end

  test "should get update" do
    get profils_update_url
    assert_response :success
  end

  test "should get show" do
    get profils_show_url
    assert_response :success
  end

end
