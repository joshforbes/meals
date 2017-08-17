require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    @recipe = create(:recipe)
  end

  test 'a recipe is not valid without a name' do
    @recipe.name = nil

    refute @recipe.valid?
  end

  test 'a recipe is not valid without a user_id' do
    @recipe.user_id = nil

    refute @recipe.valid?
  end
end
