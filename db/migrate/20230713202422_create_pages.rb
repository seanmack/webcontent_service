class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.references :account, index: true
      t.references :site, index: true, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
