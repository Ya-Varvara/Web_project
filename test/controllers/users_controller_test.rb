# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    get edit_user_path(@user),
        params: { user: { f_name: Faker::Lorem.word, s_name: Faker::Lorem.word, username: Faker::Lorem.word } }
    assert_response :success
  end
end
