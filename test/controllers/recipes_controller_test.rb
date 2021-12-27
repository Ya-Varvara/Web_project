require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include SessionHelper
  #TODO Добавить логин в пользователя
  setup do
    @recipe = recipes(:one)
  end

  # test "should get index" do
  #   get recipes_url
  #   assert_response :success
  # end

  test "should get new" do
    p User.count
    password = Faker::Lorem.word
    user = User.create(f_name: Faker::Lorem.word, s_name: Faker::Lorem.word, email: '123@gmail.com', username: Faker::Lorem.word, password: password, password_confirmation: password)
    # post session_create_url, params: { username: user.username, password: password }
    sign_in(User.last)
    p User.count
    get new_recipe_url
    assert_response :success
  end

  #TODO Сделать генерацию при помощи FAKER
  test "should create recipe" do
    assert_difference('Recipe.count', 1) do
      post recipes_url, params: { recipe: { descrip: @recipe.descrip, image: @recipe.image, ingred: @recipe.ingred, level: @recipe.level, name: @recipe.name, time: @recipe.time } }
    end
    assert_redirected_to recipe_url(Recipe.last)
  end

  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  # TODO Сделать генерацию при помощи FAKER
  test "should update recipe" do
    patch recipe_url(@recipe), params: { recipe: { descrip: @recipe.descrip, image: @recipe.image, ingred: @recipe.ingred, level: @recipe.level, name: @recipe.name, time: @recipe.time } }
    assert_redirected_to recipe_url(@recipe)
  end

  test "should destroy recipe" do
    p recipe_url(@recipe)
    assert_difference('Recipe.count', -1) do
      delete recipe_url(@recipe)
    end

    assert_redirected_to recipes_url
  end
end
