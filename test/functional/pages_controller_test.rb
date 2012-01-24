require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get thank_you" do
    get :thank_you
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

end
