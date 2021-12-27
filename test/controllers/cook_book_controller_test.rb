# frozen_string_literal: true

require 'test_helper'

class CookBookControllerTest < ActionDispatch::IntegrationTest
  test 'should get main_page' do
    get cook_book_main_page_url
    assert_response :success
  end
end
