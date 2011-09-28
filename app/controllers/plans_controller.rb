class PlansController < ApplicationController
  unloadable
  
  def show
    @plan= Plan.find(params[:id])
    @owner = @plan
    @region = Region.find(@plan.region_id)
    @images = @plan.images
    @properties = @plan.properties
    add_breadcrumb "Home", "/"
    add_breadcrumb "Regions", regions_path
    add_breadcrumb @region.title, region_path(@region)
    add_breadcrumb @plan.title
    @plan_gallery_images = @plan.images.reject{|i| !i.show_in_image_box?}
  end
  
  private
end
