class AddPlanIdToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :plan_id, :integer
    add_column :plans, :planid, :string
    add_column :properties, :lot_number, :string
  end

  def self.down
    remove_column :properties, :lot_number
    remove_column :plans, :planid
    remove_column :properties, :plan_id
  end
end