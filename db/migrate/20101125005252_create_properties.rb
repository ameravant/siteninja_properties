class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :person_id
      t.integer :region_id
      t.integer :property_type_id
      t.integer :images_count
      t.integer :features_count
      t.string :title
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :beds_count
      t.integer :baths_count
      t.text :showing_instructions
      t.text :directions
      t.text :description
      t.text :body
      t.decimal :asking_price
      t.decimal :reduced_price
      t.datetime :open_house_start
      t.datetime :open_house_end
      t.datetime :date_listed
      t.datetime :date_reduced
      t.boolean :sold
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
