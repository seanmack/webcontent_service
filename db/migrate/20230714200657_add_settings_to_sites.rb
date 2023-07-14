class AddSettingsToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :settings, :jsonb, null: false, default: {}
  end
end
