require 'test_helper'

class ReadiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get readies_show_url
    assert_response :success
  end

end
