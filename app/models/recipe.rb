class Recipe < ApplicationRecord
  validates :user_id, :name, presence: true

  belongs_to :user
end
