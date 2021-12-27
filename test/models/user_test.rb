# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'test_save_db' do
    count1 = User.count
    testUser = User.new(f_name: 'Varya', s_name: 'Yakovleva', username: 'varvara', email: 'test@mail.ru',
                        password: '123456', password_confirmation: '123456')
    testUser.save
    count2 = User.count
    assert_equal count2, count1 + 1
  end

  test 'test_get_db' do
    testUser = User.new(f_name: 'Varya', s_name: 'Yakovleva', username: 'varvara', email: 'test@mail.ru',
                        password: '123456', password_confirmation: '123456')
    assert testUser.save
    assert_equal 'Varya', User.find_by_username('varvara').f_name
    id = testUser.id
    assert_equal 'Varya', User.find_by_id(id).f_name
  end

  test 'test_delete_db' do
    testUser = User.new(f_name: 'Varya', s_name: 'Yakovleva', username: 'varvara', email: 'test@mail.ru',
                        password: '123456', password_confirmation: '123456')
    testUser.save
    count1 = User.count
    testUser.delete
    count2 = User.count
    assert_equal count2, count1 - 1
  end

  test 'test_unique_username' do
    user1 = User.new(f_name: 'Varya', s_name: 'Yakovleva', username: 'varvara', email: 'test@mail.ru',
                     password: '123456', password_confirmation: '123456')
    user1.save
    user2 = User.new(f_name: 'Varvara', s_name: 'Yakovlevaa', username: 'varvara', email: 'test@mail.ru',
                     password: '12345', password_confirmation: '12345')
    user2.validate
    assert_equal ['уже существует'], user2.errors[:username]
  end

  test 'error_first_name_empty' do
    user1 = User.new(s_name: 'Yakovleva', username: 'varvara', email: 'test@mail.ru', password: '123456',
                     password_confirmation: '123456')
    user1.validate
    assert_equal ['не может быть пустым'], user1.errors[:f_name]
  end

  test 'error_second_name_empty' do
    user1 = User.new(f_name: 'Varya', username: 'varvara', email: 'test@mail.ru', password: '123456',
                     password_confirmation: '123456')
    user1.validate
    assert_equal ['не может быть пустым'], user1.errors[:s_name]
  end

  test 'error_email_empty' do
    user1 = User.new(f_name: 'Varya', s_name: 'Yakovleva', username: 'varvara', password: '123456',
                     password_confirmation: '123456')
    user1.validate
    assert_equal ['не может быть пустым', 'имеет неверное значение'], user1.errors[:email]
  end

  test 'error_email_incorrect' do
    user1 = User.new(f_name: 'Varya', s_name: 'Yakovleva', username: 'varvara', email: 'test', password: '123456',
                     password_confirmation: '123456')
    user1.validate
    assert_equal ['имеет неверное значение'], user1.errors[:email]
  end

  test 'error_password_length' do
    user1 = User.new(f_name: 'Varya', s_name: 'Yakovleva', username: 'varvara', email: 'test@mail.ru', password: '12',
                     password_confirmation: '12')
    user1.validate
    assert_equal ['недостаточной длины (не может быть меньше 3 символов)'], user1.errors[:password]
  end
end
