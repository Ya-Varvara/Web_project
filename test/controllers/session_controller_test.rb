# frozen_string_literal: true

require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test 'should get login' do
    get session_login_url
    assert_response :success
  end

  test 'should get create' do
    post session_create_url
    assert_redirected_to controller: :session, action: :login
  end
end
