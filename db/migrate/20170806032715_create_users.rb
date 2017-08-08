class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :auth_token
      t.datetime :token_last_used_at

      t.timestamps

      t.index :email, unique: true
      t.index :auth_token, unique: true
    end
  end
end
