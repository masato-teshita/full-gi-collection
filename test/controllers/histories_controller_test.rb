require 'test_helper'

class HistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get histories_index_url
    assert_response :success
  end

end
