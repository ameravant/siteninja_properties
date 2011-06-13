class RegionsController < ApplicationController
  unloadable
  before_filter :get_page
  def index
    add_breadcrumb "Home", "/"
    add_breadcrumb "Regions"
    @regions = Region.all
  end
  
  def show
    add_breadcrumb "Home", "/"
    add_breadcrumb "Regions", regions_path
    @region = Region.find(params[:id])
    add_breadcrumb @region.title
    @active_properties = @region.properties.active.by_price
    @sold_properties = @region.properties.sold.by_price
    @pending_properties = @region.properties.pending.by_price
    @properties = Property.all(:joins => ['LEFT OUTER JOIN people ON people.id = properties.person_id'], :conditions =>[ "region_id = ? and confirmed = ? and sold = ?", @region.id, true, false], :order => "reduced_price asc")
  end
  
  private
  
  def get_page
    @page = Page.find_by_permalink("regions")
    @side_column = @page.column_id
    # if @page.permalink == "home"
    #   @features = Feature.find(:all, :order => :position)
    # end
    #should refactor the following into scopes and add scoping by scoping
    ops = "person_id = #{@page.author_id}" if @page.author_id
    articles = @page.article_category_id.nil? ? Article.published.find(:all, :conditions => ops) : @page.article_category.articles.published.find(:all, :conditions => ops)
    @testimonial = Testimonial.featured.sort_by(&:rand).first
    @article_categories = ArticleCategory.active
    @article_archive = articles.group_by { |a| [a.published_at.month, a.published_at.year] }
    @article_authors = Person.active.find(:all, :conditions => "articles_count > 0")
    @article_tags = Article.published.tag_counts.sort_by(&:name)
    @recent_articles = articles
    if @page.show_events? and @cms_config['modules']['events']
      @events = Event.future[0..2]
    end
    @menu = @page.menus.first
    @side_column_sections = ColumnSection.all(:conditions => {:column_id => @page.column_id, :visible => true})
  end
end
