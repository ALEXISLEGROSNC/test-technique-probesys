require "test_helper"

class TournoiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tournoi_index_url
    assert_response :success
  end
end
