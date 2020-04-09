require 'test_helper'

class ReservationtablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservationtables_index_url
    assert_response :success
  end

end
