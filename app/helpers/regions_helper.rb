module RegionsHelper
  def display_status(property)
    unless property.status == "Active" || property.status.blank?
      "<span class=\"#{property.status.downcase}\">#{property.status}</span>"
    else
      ""
    end
  end
end
