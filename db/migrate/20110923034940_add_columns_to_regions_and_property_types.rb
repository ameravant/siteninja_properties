class AddColumnsToRegionsAndPropertyTypes < ActiveRecord::Migration
  def self.up
    add_column :regions, :tab_4_title, :string
    add_column :regions, :tab_4_description, :text
    add_column :regions, :tab_5_title, :string
    add_column :regions, :tab_5_description, :text
    add_column :regions, :gallery_id, :integer
    add_column :property_types, :tab_1_title, :string
    add_column :property_types, :tab_1_description, :text
    add_column :property_types, :tab_2_title, :string
    add_column :property_types, :tab_2_description, :text
    add_column :property_types, :tab_3_title, :string
    add_column :property_types, :tab_3_description, :text
    add_column :property_types, :tab_4_title, :string
    add_column :property_types, :tab_4_description, :text
    add_column :property_types, :tab_5_title, :string
    add_column :property_types, :tab_5_description, :text
    add_column :properties, :other, :text
  end

  def self.down
    remove_column :properties, :other
    remove_column :property_types, :tab_5_description
    remove_column :property_types, :tab_5_title
    remove_column :property_types, :tab_4_description
    remove_column :property_types, :tab_4_title
    remove_column :property_types, :tab_3_description
    remove_column :property_types, :tab_3_title
    remove_column :property_types, :tab_2_description
    remove_column :property_types, :tab_2_title
    remove_column :property_types, :tab_1_description
    remove_column :property_types, :tab_1_title
    remove_column :regions, :gallery_id
    remove_column :regions, :tab_5_description
    remove_column :regions, :tab_5_title
    remove_column :regions, :tab_4_description
    remove_column :regions, :tab_4_title
  end
end