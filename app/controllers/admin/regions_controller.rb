class Admin::RegionsController < AdminController
  unloadable
  before_filter :authorization
  before_filter :find_region, :only => [:edit, :update, :destroy]
  
  def index
    add_breadcrumb "Regions"
    @regions = Region.all
  end
  
  def edit
    add_breadcrumb "Regions", admin_regions_path
    add_breadcrumb @region.title
  end
  
  def update
    if @region.update_attributes(params[:region])
      flash[:message] = "Region updated successfully"
      redirect_to admin_regions_path
    else
    render :action => "edit"
    end
  end
  
  def new
    add_breadcrumb "Regions", admin_regions_path
    add_breadcrumb "Create a new region"
    @region = Region.new
  end
  
  def create
    @region = Region.new(params[:region])
    if @region.save
      flash[:message] = "Region saved successfully"
      redirect_to admin_regions_path
    else
      render :action => :new
    end
  end
  
  def destroy
    @region.destroy
    respond_to :js
  end
  private
  
  def authorization
    authorize(@permissions['admin'], "Admin")
  end
  
  def find_region
    @region = Region.find(params[:id])
  end
  
end