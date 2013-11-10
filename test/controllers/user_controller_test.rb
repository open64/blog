require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get registration" do
    get :registration
    assert_response :success
  end

  test "should get log_in" do
    get :log_in
    assert_response :success
  end

  test "should get log_out" do
    get :log_out
    assert_response :success
  end

end
