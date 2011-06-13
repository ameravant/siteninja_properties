class CreatePropertySearches < ActiveRecord::Migration
  def self.up
    create_table :property_searches do |t|
      t.integer :property_type_id, :region_id
      t.float :max_price
      t.float :min_price
      t.timestamps
    end
  end

  def self.down
    drop_table :property_searches
  end
end
