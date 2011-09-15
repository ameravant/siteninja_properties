class PropertyType < ActiveRecord::Base
  unloadable
  has_permalink :title
  has_many :properties
  belongs_to :region
  has_many :images, :as => :viewable, :dependent => :destroy
  has_many :features, :as => :featurable, :dependent => :destroy
  
  def to_params
    "#{self.id}-#{self.permalink}"
  end
end
