resources :properties, :collection => {:print => :get}, :member => {:print => :get}
resources :property_searches
resources :regions, :has_many => :properties
resources :profiles, :collection => { :forgot_password => :any }, :has_many => :comments
namespace :admin do |admin|
  admin.resources :regions, :has_many => { :features, :menus } do |region|
    region.resources :menus
    region.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put }
    region.resources :properties
  end
  admin.resources :properties, :has_many => { :features, :images } do |property|
    property.resources :menus
    property.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put, :add_multiple => :get }
    property.resources :events, :as => :open_houses
  end
  admin.resources :profiles, :has_many => :comments
  admin.resources :property_types
end
