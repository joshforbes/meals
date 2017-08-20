require 'test_helper'

class MealSerializerTest < ActiveSupport::TestCase
  def serialized_recipe(meal)
    {
      id: meal.id,
      user_id: meal.user_id,
      recipe_id: meal.recipe_id,
      date: meal.date,
      recipe: RecipeSerializer.new(meal.recipe).attributes
    }.to_json
  end

  test 'it serializes a meal' do
    meal = create(:meal)
    serializer = MealSerializer.new(meal)

    serialized = serializer.to_json

    assert_equal(serialized_recipe(meal), serialized)
  end
end
