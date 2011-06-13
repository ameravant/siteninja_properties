class PropertyType < ActiveRecord::Base
  has_permalink :title
  has_many :properties
  
end
