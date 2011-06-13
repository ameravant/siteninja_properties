class Region < ActiveRecord::Base
  has_permalink :title
  has_many :properties
  has_many :features, :as => :featurable, :dependent => :destroy
  has_many :images, :as => :viewable, :dependent => :destroy
  # accepts_nested_attributes_for :images
end
