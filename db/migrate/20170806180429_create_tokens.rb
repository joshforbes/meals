class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.datetime :last_used_at

      t.timestamps

      t.index :body, unique: true
    end
  end
end
