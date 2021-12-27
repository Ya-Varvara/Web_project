# frozen_string_literal: true

require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    password = Faker::Lorem.word
    user = User.create(f_name: Faker::Lorem.word, s_name: Faker::Lorem.word, email: '123@gmail.com',
                       username: Faker::Lorem.word, password: password, password_confirmation: password)
    post session_create_url, params: { username: user.username, password: password }
    @recipe = Recipe.create(name: 'asd', ingred: 'sdf', level: 1, time: 20, descrip: 'dsf', user_id: user.id)
  end

  test 'should get new' do
    get new_recipe_url
    assert_response :success
  end

  test 'should create recipe' do
    assert_difference('Recipe.count', 1) do
      post recipes_url,
           params: { recipe: { descrip: Faker::Lorem.word, ingred: Faker::Lorem.word, level: 1, name: Faker::Lorem.word, time: 30,
                               user_id: 1 } }
    end
    assert_redirected_to recipe_url(Recipe.last)
  end

  test 'should show recipe' do
    get recipe_url(@recipe)
    assert_response :success
  end

  test 'should get edit' do
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  test 'should update recipe' do
    patch recipe_url(@recipe),
          params: { recipe: { descrip: @recipe.descrip, image: @recipe.image, ingred: @recipe.ingred, level: @recipe.level,
                              name: @recipe.name, time: 30 } }
    assert_redirected_to recipe_url(@recipe)
  end

  test 'should destroy recipe' do
    assert_difference('Recipe.count', -1) do
      delete recipe_url(@recipe)
    end
    assert_redirected_to user_url(@recipe.user_id)
  end
end
