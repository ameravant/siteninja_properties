class PropertiesController < ApplicationController
  unloadable
  def index
    @region = Region.find(params[:region_id])
    @properties = Property.all(:joins => ['LEFT OUTER JOIN people ON people.id = properties.person_id'], :conditions => ["region_id = ? and confirmed = ? and sold = ?", @region.id, true, false])
  end
  
  def show
    @page = Page.find_by_permalink("properties")
    @main_column = ((@page.main_column_id.blank? or Column.find_by_id(@page.main_column_id).blank?) ? Column.first(:conditions => {:title => "Default", :column_location => "main_column"}) : Column.find(@page.main_column_id))
    @main_column_sections = ColumnSection.all(:conditions => {:column_id => @main_column.id, :visible => true, :column_section_id => nil})  
    @property = Property.find(params[:id])
    if !@property.plan.blank?
      @property.beds_count = @property.plan.beds_count if @property.beds_count.blank?
      @property.baths_count = @property.plan.baths_count if @property.baths_count.blank?
      @property.size = @property.plan.size if @property.size.blank?
      @property.payment = @property.plan.payment if @property.payment.blank?
      @property.stories = @property.plan.stories if @property.stories.blank?
      @property.garage_size = @property.plan.garage_size if @property.garage_size.blank?
      @property.other = @property.plan.other if @property.other.blank?
    end
    @region = Region.find(@property.region_id)
    @images = @property.images
    @property_gallery_images = @property.images.reject{|i| !i.show_in_image_box?}
    add_breadcrumb "Home", "/"
    add_breadcrumb !CMS_CONFIG['site_settings']['region_title'].blank? ? CMS_CONFIG['site_settings']['region_title'].pluralize : "Regions", regions_path
    add_breadcrumb @region.title, region_path(@region)
    add_breadcrumb @property.formatted_address
    if params[:print] == "true"
      render :layout => false
    end
  end
  
  private
end
