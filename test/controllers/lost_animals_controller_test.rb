require 'test_helper'

class LostAnimalsControllerTest < ActionDispatch::IntegrationTest
  #Test to check if it goes to index
  test "should get index" do
    get lost_animals_index_url
    assert_response :success
  end

end
