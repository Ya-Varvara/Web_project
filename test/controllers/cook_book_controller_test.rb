require "test_helper"

class CookBookControllerTest < ActionDispatch::IntegrationTest
  test "should get main_page" do
    get cook_book_main_page_url
    assert_response :success
  end

  test "should get login" do
    get cook_book_login_url
    assert_response :success
  end

  test "should get register" do
    get cook_book_register_url
    assert_response :success
  end

  test "should get user_page" do
    get cook_book_user_page_url
    assert_response :success
  end

  test "should get cook_page" do
    get cook_book_cook_page_url
    assert_response :success
  end
end
