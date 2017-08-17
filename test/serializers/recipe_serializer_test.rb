require 'test_helper'

class RecipeSerializerTest < ActiveSupport::TestCase
  def serialized_recipe(recipe)
    {
      id: recipe.id,
      user_id: recipe.user_id,
      name: recipe.name,
      user: UserSerializer.new(recipe.user)
    }.to_json
  end

  test 'it serializes a recipe' do
    recipe = create(:recipe)
    serializer = RecipeSerializer.new(recipe)

    serialized = serializer.to_json

    assert_equal(serialized_recipe(recipe), serialized)
  end
end
