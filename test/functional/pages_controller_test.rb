require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get services" do
    get :services
    assert_response :success
  end

  test "should get news_item" do
    get :news_item
    assert_response :success
  end

  test "should get news_archives" do
    get :news_archives
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get policy" do
    get :policy
    assert_response :success
  end

end
