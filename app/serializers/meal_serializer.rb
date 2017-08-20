class MealSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :recipe_id, :date
  has_one :recipe, embed: :ids
end
