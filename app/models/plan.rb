class Plan < ActiveRecord::Base
  has_many :properties
  belongs_to :region
  has_permalink :title
  belongs_to :property_type
  has_many :images, :as => :viewable, :dependent => :destroy
  has_many :features, :as => :featurable, :dependent => :destroy
  
  def to_param
    "#{self.id}-#{self.permalink}"
  end
end
