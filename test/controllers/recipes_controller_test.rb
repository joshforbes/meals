require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @recipe = create(:recipe, user_id: @user.id)
  end

  test "should get index" do
    get recipes_url, headers: auth_headers(@user)

    assert_response :success
    assert_includes response.body, RecipeSerializer.new(@recipe).to_json
  end

  test "should show recipe" do
    get recipe_url(@recipe), headers: auth_headers(@user)

    assert_response :success
    assert_equal RecipeSerializer.new(@recipe).to_json, response.body
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: 'Hot Soup' } }, headers: auth_headers(@user)
    end

    assert_response 201
    assert_not_nil(Recipe.find_by_name('Hot Soup'))
  end

  test "should update recipe" do
    patch recipe_url(@recipe), params: { recipe: { name: 'New Soup' } }, headers: auth_headers(@user)

    assert_response 200
    assert_not_nil(Recipe.find_by_name('New Soup'))
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete recipe_url(@recipe), headers: auth_headers(@user)
    end

    assert_response 204
  end
end
