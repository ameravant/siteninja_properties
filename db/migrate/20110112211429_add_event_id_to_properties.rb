class AddEventIdToProperties < ActiveRecord::Migration
  def self.up
    add_column :events, :property_id, :integer
  end

  def self.down
    remove_column :events, :property_id
  end
end
