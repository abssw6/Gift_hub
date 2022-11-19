require "test_helper"

class GiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gifts_show_url
    assert_response :success
  end
end
