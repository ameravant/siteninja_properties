class AddStatusToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :status, :string
  end

  def self.down
    remove_column :properties, :status
  end
end
