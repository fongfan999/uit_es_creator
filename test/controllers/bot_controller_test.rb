require 'test_helper'

class BotControllerTest < ActionDispatch::IntegrationTest
  test "should get webhoook" do
    get bot_webhoook_url
    assert_response :success
  end

end
