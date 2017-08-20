require 'test_helper'

class MealTest < ActiveSupport::TestCase
  setup do
    @meal = create(:meal)
  end

  test 'a meal is not valid without a user' do
    @meal.user_id = nil

    refute @meal.valid?
  end

  test 'a recipe is not valid without a recipe_id' do
    @meal.recipe_id = nil

    refute @meal.valid?
  end
end
