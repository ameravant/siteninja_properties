class CreatePropertyTables < ActiveRecord::Migration
  def self.up
	  # create_table "plans", :force => true do |t|
	  #   t.string   "permalink"
	  #   t.integer  "region_id"
	  #   t.integer  "property_type_id"
	  #   t.integer  "images_count"
	  #   t.integer  "features_count"
	  #   t.string   "title"
	  #   t.string   "address"
	  #   t.string   "city"
	  #   t.string   "state"
	  #   t.string   "zip"
	  #   t.integer  "beds_count"
	  #   t.integer  "baths_count"
	  #   t.text     "description"
	  #   t.text     "body"
	  #   t.decimal  "list_price"
	  #   t.boolean  "active"
	  #   t.datetime "created_at"
	  #   t.datetime "updated_at"
	  #   t.string   "size"
	  #   t.string   "payment"
	  #   t.string   "stories"
	  #   t.string   "garage_size"
	  #   t.text     "other"
	  #   t.string   "tab_1_title"
	  #   t.text     "tab_1_description"
	  #   t.string   "tab_2_title"
	  #   t.text     "tab_2_description"
	  #   t.string   "tab_3_title"
	  #   t.text     "tab_3_description"
	  #   t.string   "tab_4_title"
	  #   t.text     "tab_4_description"
	  #   t.string   "tab_5_title"
	  #   t.text     "tab_5_description"
	  #   t.string   "planid"
	  # end
    add_column :plans, :account_id, :integer, :default => 1
    add_column :plans, :master, :boolean, :default => false
    add_column :plans, :column_id, :integer

   #  create_table "properties", :force => true do |t|
	  #   t.integer  "person_id"
	  #   t.integer  "region_id"
	  #   t.integer  "property_type_id"
	  #   t.integer  "images_count"
	  #   t.integer  "features_count"
	  #   t.string   "title"
	  #   t.string   "address"
	  #   t.string   "city"
	  #   t.string   "state"
	  #   t.string   "zip"
	  #   t.integer  "beds_count"
	  #   t.integer  "baths_count"
	  #   t.text     "showing_instructions"
	  #   t.text     "directions"
	  #   t.text     "description"
	  #   t.text     "body"
	  #   t.decimal  "asking_price"
	  #   t.decimal  "reduced_price"
	  #   t.datetime "open_house_start"
	  #   t.datetime "open_house_end"
	  #   t.datetime "date_listed"
	  #   t.datetime "date_reduced"
	  #   t.boolean  "sold"
	  #   t.boolean  "active"
	  #   t.datetime "created_at"
	  #   t.datetime "updated_at"
	  #   t.string   "status"
	  #   t.string   "size"
	  #   t.string   "payment"
	  #   t.string   "stories"
	  #   t.string   "garage_size"
	  #   t.text     "other"
	  #   t.integer  "plan_id"
	  #   t.string   "lot_number"
	  # end
    add_column :properties, :account_id, :integer, :default => 1
    add_column :properties, :master, :boolean, :default => false
    add_column :properties, :column_id, :integer

	  # create_table "property_types", :force => true do |t|
	  #   t.string   "title"
	  #   t.string   "permalink"
	  #   t.text     "description"
	  #   t.integer  "images_count"
	  #   t.integer  "features_count"
	  #   t.datetime "created_at"
	  #   t.datetime "updated_at"
	  #   t.integer  "region_id"
	  #   t.string   "tab_1_title"
	  #   t.text     "tab_1_description"
	  #   t.string   "tab_2_title"
	  #   t.text     "tab_2_description"
	  #   t.string   "tab_3_title"
	  #   t.text     "tab_3_description"
	  #   t.string   "tab_4_title"
	  #   t.text     "tab_4_description"
	  #   t.string   "tab_5_title"
	  #   t.text     "tab_5_description"
	  # end
    add_column :property_types, :account_id, :integer, :default => 1
    add_column :property_types, :master, :boolean, :default => false
    add_column :property_types, :column_id, :integer


    # create_table "regions", :force => true do |t|
    #   t.string   "title"
    #   t.string   "permalink"
    #   t.text     "description"
    #   t.integer  "images_count"
    #   t.integer  "features_count"
    #   t.datetime "created_at"
    #   t.datetime "updated_at"
    #   t.string   "address"
    #   t.text     "office_address"
    #   t.string   "phone"
    #   t.string   "email"
    #   t.text     "directions"
    #   t.string   "tab_1_title"
    #   t.text     "tab_1_description"
    #   t.string   "tab_2_title"
    #   t.text     "tab_2_description"
    #   t.string   "tab_3_title"
    #   t.text     "tab_3_description"
    #   t.string   "tab_4_title"
    #   t.text     "tab_4_description"
    #   t.string   "tab_5_title"
    #   t.text     "tab_5_description"
    #   t.integer  "gallery_id"
    # end
    add_column :regions, :account_id, :integer, :default => 1
    add_column :regions, :master, :boolean, :default => false
    add_column :regions, :column_id, :integer

  end

  def self.down
  end
end
