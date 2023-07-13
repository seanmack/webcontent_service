class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.references :account, index: true, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
