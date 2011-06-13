module PropertiesHelper
  def fields_for_open_house(open_house, &block)
    prefix = open_house.new_record? ? "new" : "existing"
    fields_for("property[#{prefix}_open_house][]", open_house, &block)
  end
  def display_status(property)
    unless property.status == "Active" || property.status.blank?
      "<span class=\"#{property.status.downcase}\">#{property.status}</span>"
    else
      ""
    end
  end
end
