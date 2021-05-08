require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get chatrooms_new_url
    assert_response :success
  end

end
