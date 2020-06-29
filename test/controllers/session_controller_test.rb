require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get session_home_url
    assert_response :success
  end

end
