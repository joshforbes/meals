class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :recipe, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
