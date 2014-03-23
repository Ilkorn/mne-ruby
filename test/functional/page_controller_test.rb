require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get meetings" do
    get :meetings
    assert_response :success
  end

  test "should get create_meet" do
    get :create_meet
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

end
