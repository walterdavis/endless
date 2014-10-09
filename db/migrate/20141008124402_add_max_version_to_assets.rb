class AddMaxVersionToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :max_version, :integer
  end
end
