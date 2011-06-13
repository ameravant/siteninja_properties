class Admin::PropertyTypesController < ApplicationController
  
  unloadable
  before_filter :authorization
  before_filter :find_property_type, :only => [:edit, :update, :destroy]
  
  def index
    add_breadcrumb "Property Types"
    @property_types = PropertyType.all
  end
  
  def edit
    add_breadcrumb "Property Types", admin_property_types_path
    add_breadcrumb @property_type.title
  end
  
  def update
    if @property_type.update_attributes(params[:property_type])
      flash[:message] = "Property Type updated successfully"
      redirect_to admin_property_types_path
    else
    render :action => "edit"
    end
  end
  
  def new
    add_breadcrumb "Property Types", admin_property_types_path
    add_breadcrumb "Create a new property_type"
    @property_type = PropertyType.new
  end
  
  def create
    @property_type = PropertyType.new(params[:property_type])
    if @property_type.save
      flash[:message] = "Property Type saved successfully"
      redirect_to admin_property_types_path
    else
      render :action => :new
    end
  end
  
  def destroy
    @property_type.destroy
    respond_to :js
  end
  
  private
  
  def authorization
    authorize(@permissions['admin'], "Admin")
  end
  
  def find_property_type
    @property_type = PropertyType.find(params[:id])
  end
  
end
