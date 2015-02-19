require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get corporate" do
    get :corporate
    assert_response :success
  end

  test "should get ip" do
    get :ip
    assert_response :success
  end

  test "should get employment" do
    get :employment
    assert_response :success
  end

  test "should get real_estate" do
    get :real_estate
    assert_response :success
  end

  test "should get venture_cap" do
    get :venture_cap
    assert_response :success
  end

end
