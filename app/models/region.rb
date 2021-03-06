class Region < ActiveRecord::Base
  has_permalink :title
  has_many :properties
  has_many :property_types
  has_many :plans
  has_many :features, :as => :featurable, :dependent => :destroy
  has_many :images, :as => :viewable, :dependent => :destroy
  # accepts_nested_attributes_for :images
  
  def to_param
    "#{self.id}-#{self.permalink}"
  end
end
