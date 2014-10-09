class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :project, index: true
      t.string :name
      t.integer :version, default: 1
      t.integer :original_id

      t.timestamps
    end
    add_index :assets, :original_id
  end
end
