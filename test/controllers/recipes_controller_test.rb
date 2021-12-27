require 'test_helper'


class RecipesControllerTest < ActionDispatch::IntegrationTest
  #TODO Добавить логин в пользователя
  setup do
    get session_login_url
    sign_in(users(:one))
    @recipe = recipes(:one)
  end

  # test "should get index" do
  #   get recipes_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_recipe_url
    assert_response :success
  end

  #TODO Сделать генерацию при помощи FAKER
  test "should create recipe" do
    assert_difference('Recipe.count') do
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
