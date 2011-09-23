class AddFieldsToRegionsAndProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :size, :string
    add_column :properties, :payment, :string
    add_column :properties, :stories, :string
    add_column :properties, :garage_size, :string
    add_column :regions, :address, :string
    add_column :regions, :office_address, :text
    add_column :regions, :phone, :string
    add_column :regions, :email, :string
    add_column :regions, :directions, :text
    add_column :regions, :tab_1_title, :string
    add_column :regions, :tab_1_description, :text
    add_column :regions, :tab_2_title, :string
    add_column :regions, :tab_2_description, :text
    add_column :regions, :tab_3_title, :string
    add_column :regions, :tab_3_description, :text
    add_column :property_types, :region_id, :integer
  end

  def self.down
    remove_column :property_types, :features_count
    remove_column :property_types, :images_count
    remove_column :property_types, :region_id
    remove_column :regions, :tab_3_description
    remove_column :regions, :tab_3_title
    remove_column :regions, :tab_2_description
    remove_column :regions, :tab_2_title
    remove_column :regions, :tab_1_description
    remove_column :regions, :tab_1_title
    remove_column :regions, :directions
    remove_column :regions, :email
    remove_column :regions, :phone
    remove_column :regions, :office_address
    remove_column :regions, :address
    remove_column :properties, :garage_size
    remove_column :properties, :stories
    remove_column :properties, :payment
    remove_column :properties, :size
  end
end