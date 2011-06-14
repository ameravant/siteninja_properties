module Admin::PropertiesHelper
  def fields_for_event(event, &block)
    prefix = event.new_record? ? "new" : "existing"
    fields_for("property[#{prefix}_events][]", event, &block)
  end
  
  def add_event_link(name) 
    link_to_function name do |page| 
      page.insert_html :bottom, :events, :partial => 'event', :object => Event.new 
    end 
  end
  def default_body
    @cms_config['site_settings']['default_property_body']
  end
end
