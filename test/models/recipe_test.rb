# frozen_string_literal: true

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test 'test_save_db' do
    count1 = Recipe.count
    recipe1 = Recipe.new(name: 'Cake', level: 1, time: '30', ingred: 'Мука', descrip: 'Cook',
                         image: 'https://opt-1183421.ssl.1c-bitrix-cdn.ru/upload/iblock/d15/acz3BXrIx5R97LNTV46dr.jpg?1634302081682104', user_id: User.first.id)
    recipe1.save
    count2 = Recipe.count
    assert_equal count2, count1 + 1
  end

  test 'test_get_db' do
    recipe1 = Recipe.new(name: 'Cake', level: 1, time: '30', ingred: 'Мука', descrip: 'Cook',
                         image: 'https://opt-1183421.ssl.1c-bitrix-cdn.ru/upload/iblock/d15/acz3BXrIx5R97LNTV46dr.jpg?1634302081682104', user_id: User.first.id)
    recipe1.save
    id = recipe1.id
    assert_equal 'Cake', Recipe.find_by_id(id).name
  end

  test 'test_delete_db' do
    recipe1 = Recipe.new(name: 'Cake', level: 1, time: '30', ingred: 'Мука', descrip: 'Cook',
                         image: 'https://opt-1183421.ssl.1c-bitrix-cdn.ru/upload/iblock/d15/acz3BXrIx5R97LNTV46dr.jpg?1634302081682104', user_id: User.first.id)
    recipe1.save
    count1 = Recipe.count
    recipe1.delete
    count2 = Recipe.count
    assert_equal count2, count1 - 1
  end

  test 'test_error_name' do
    recipe1 = Recipe.new(name: 'Cake123', level: 1, time: '30', ingred: 'Мука', descrip: 'Cook',
                         image: 'https://opt-1183421.ssl.1c-bitrix-cdn.ru/upload/iblock/d15/acz3BXrIx5R97LNTV46dr.jpg?1634302081682104', user_id: User.first.id)
    recipe1.validate
    assert_equal ['имеет неверное значение'], recipe1.errors[:name]
  end

  test 'test_error_time' do
    recipe1 = Recipe.new(name: 'Cake', level: 1, time: 'asd', ingred: 'Мука', descrip: 'Cook',
                         image: 'https://opt-1183421.ssl.1c-bitrix-cdn.ru/upload/iblock/d15/acz3BXrIx5R97LNTV46dr.jpg?1634302081682104', user_id: User.first.id)
    recipe1.validate
    assert_equal ['не является числом'], recipe1.errors[:time]
  end

  test 'test_error_image' do
    recipe1 = Recipe.new(name: 'Cake', level: 1, time: '10', ingred: 'Мука', descrip: 'Cook', image: 'asd',
                         user_id: User.first.id)
    recipe1.validate
    assert_equal ['имеет неверное значение'], recipe1.errors[:image]
  end
end
