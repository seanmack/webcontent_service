class CreateApiTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :api_tokens do |t|
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.string :token
      t.datetime :expires_at
      t.datetime :last_used_at

      t.timestamps
      t.index :token, unique: true
    end
  end
end
