class AddDreLicenseToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :dre_license, :string
    add_column :profiles, :show_dre_license, :boolean
    add_column :profiles, :comments_count, :integer
  end

  def self.down
    remove_column :people, :dre_license
    remove_column :profiles, :show_dre_license
    remove_column :profiles, :comments_count
  end
end
