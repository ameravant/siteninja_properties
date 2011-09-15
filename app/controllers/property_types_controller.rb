class PropertyTypesController < ApplicationController
  unloadable
  
  def show
    @property_type = PropertyType.find(params[:id])
  end
  
  private
end
