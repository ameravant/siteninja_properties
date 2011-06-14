class CreatePropertySearches < ActiveRecord::Migration
  def self.up
    search = ColumnSectionType.create(:title => "Property Search", :controller_name => "properties", :partial_name => "property_search_for_side_column")
    c = Column.first
    ColumnSection.create(:column_id => c.id, :column_section_type_id => search.id, :title => "Property Search")
  end

  def self.down
    search = ColumnSectionType.find_by_title("Property Search")
    sections = search.column_sections
    search.destroy
    for section in sections
      section.destroy
    end
  end
end