require 'test_helper'

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get discussions_index_url
    assert_response :success
  end

  test "should get show" do
    get discussions_show_url
    assert_response :success
  end

end
