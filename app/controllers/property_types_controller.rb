class PropertyTypesController < ApplicationController
  unloadable
  
  def show
    @property_type = PropertyType.find(params[:id])
    @images = @property_type.images
  end
  
  private
end
