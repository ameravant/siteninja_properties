class AddRegistrationForSideColumn < ActiveRecord::Migration
  def self.up
    property_type = ColumnSectionType.create(:title => "Register", :controller_name => "profiles", :partial_name => "register_for_side_column")
    ColumnSection.create(:title => "Register", :column_section_type_id => property_type.id, :column_id => 1)
  end

  def self.down
    change_column :properties, :body, :text, :default => ''
  end
end
