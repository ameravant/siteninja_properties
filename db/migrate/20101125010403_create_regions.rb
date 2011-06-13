class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :title
      t.string :permalink
      t.text :description
      t.integer :images_count
      t.integer :features_count
      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
