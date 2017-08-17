class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name

  has_one :user, embed: :ids
end
