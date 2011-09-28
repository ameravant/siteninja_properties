resources :properties, :collection => {:print => :get}, :member => {:print => :get}
resources :property_searches
resources :property_types
resources :plans
resources :regions, :has_many => :properties
resources :profiles, :collection => { :forgot_password => :any }, :has_many => :comments
namespace :admin do |admin|
  admin.resources :regions, :has_many => { :features, :menus } do |region|
    region.resources :menus
    region.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put, :add_multiple => :get }
    region.resources :properties
  end
  admin.resources :properties, :has_many => { :features, :images } do |property|
    property.resources :menus
    property.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put, :add_multiple => :get }
  end
  admin.resources :profiles, :has_many => :comments
  admin.resources :property_types, :has_many => { :features, :images } do |property_type|
    property_type.resources :menus
    property_type.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put, :add_multiple => :get }
  end
  admin.resources :plans, :has_many => { :features, :images } do |plan|
    plan.resources :menus
    plan.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put, :add_multiple => :get }
  end
end
