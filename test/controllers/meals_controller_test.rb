require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @meal = create(:meal, user_id: @user.id)
  end

  test "should get index" do
    get meals_url, headers: auth_headers(@user)

    assert_response :success
    assert_includes response.body, MealSerializer.new(@meal).to_json
  end

  test "should show meal" do
    get meal_url(@meal), headers: auth_headers(@user)

    assert_response :success
    assert_includes response.body, MealSerializer.new(@meal).to_json
  end

  test "should create meal" do
    recipe = create(:recipe)

    assert_difference('Meal.count') do
      post meals_url, params: { meal: { recipe_id: recipe.id, date: Date.current } }, headers: auth_headers(@user)
    end

    assert_response 201
    assert_not_nil(Meal.where(recipe_id: recipe.id, date: Date.current))
  end

  test "should update meal" do
    new_recipe = create(:recipe)

    patch meal_url(@meal), params: { meal: { recipe_id: new_recipe.id } }, headers: auth_headers(@user)

    assert_response 200
    assert_not_nil(Meal.find_by_recipe_id(new_recipe.id))
  end

  test "should destroy meal" do
    assert_difference('Meal.count', -1) do
      delete meal_url(@meal), headers: auth_headers(@user)
    end

    assert_response 204
  end
end
