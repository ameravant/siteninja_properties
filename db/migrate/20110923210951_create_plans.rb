class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string   "permalink"
      t.integer  "region_id"
      t.integer  "property_type_id"
      t.integer  "images_count"
      t.integer  "features_count"
      t.string   "title"
      t.string   "address"
      t.string   "city"
      t.string   "state"
      t.string   "zip"
      t.integer  "beds_count"
      t.integer  "baths_count"
      t.text     "description"
      t.text     "body"
      t.decimal  "list_price"
      t.boolean  "active"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "size"
      t.string   "payment"
      t.string   "stories"
      t.string   "garage_size"
      t.text     "other"
      t.string   "tab_1_title"
      t.text     "tab_1_description"
      t.string   "tab_2_title"
      t.text     "tab_2_description"
      t.string   "tab_3_title"
      t.text     "tab_3_description"
      t.string   "tab_4_title"
      t.text     "tab_4_description"
      t.string   "tab_5_title"
      t.text     "tab_5_description"
      t.timestamps
    end
    add_column :properties, :lot_number, :string
    add_column :properties, :planid, :string
  end

  def self.down
    remove_column :properties, :planid
    remove_column :properties, :lot_number
    drop_table :plans
  end
end