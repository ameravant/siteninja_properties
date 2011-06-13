class Admin::PropertiesController < AdminController
  unloadable # http://dev.rubyonrails.org/ticket/6001
  before_filter :authorization
  before_filter :find_property, :only => [:edit, :update, :destroy]
  
  def index
    add_breadcrumb "Properties"
    current_user.has_role("admin") ? @properties = Property.all : @properties = Property.all(:conditions => {:person_id => current_user.person.id})
  end
  
  def update
    if @property.update_attributes(params[:property])
      flash[:message] = "Property updated successfully"
      if request.referrer =~ /add_multiple$/i
        redirect_to [:admin, @property, :images]
      else
        redirect_to admin_properties_path
      end
    else
      render :action => "edit"
    end
  end
  
  def edit
    add_breadcrumb "Properties", admin_properties_path
    add_breadcrumb @property.address
  end
  
  def create
    @property = Property.new(params[:property])
    @property.person_id = current_user.person.id
    if @property.save
      flash[:message] = "Property saved successfully"
      redirect_to new_admin_property_image_path(@property)
    else
      render :action => "new"
    end
  end
  
  def new
    @property = Property.new
    @property.events.build    
  end
  
  def destroy
    @property.destroy
    respond_to :js
  end
  
  private
  
  def authorization
    authorize(['Property Owner', 'Admin'], "Properties")
  end
  
  def find_property
    @property = Property.find(params[:id])
  end
end