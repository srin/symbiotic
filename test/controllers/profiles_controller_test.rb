require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get myprofile" do
    get :myprofile
    assert_response :success
  end

  test "should get lawyerprofile" do
    get :lawyerprofile
    assert_response :success
  end

end
