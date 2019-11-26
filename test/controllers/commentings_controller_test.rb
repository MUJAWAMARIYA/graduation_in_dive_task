require 'test_helper'

class CommentingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get commentings_create_url
    assert_response :success
  end

end
