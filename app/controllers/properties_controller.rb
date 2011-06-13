class PropertiesController < ApplicationController
  unloadable
  def index
    @region = Region.find(params[:region_id])
    @properties = Property.all(:joins => ['LEFT OUTER JOIN people ON people.id = properties.person_id'], :conditions => ["region_id = ? and confirmed = ? and sold = ?", @region.id, true, false])
  end
  
  def show
    @property = Property.find(params[:id])
    @region = Region.find(@property.region_id)
    add_breadcrumb "Home", "/"
    add_breadcrumb "Regions", regions_path
    add_breadcrumb @region.title, region_path(@region)
    add_breadcrumb @property.formatted_address
    if params[:print] == "true"
      render :layout => false
    end
  end
  
  private
end
