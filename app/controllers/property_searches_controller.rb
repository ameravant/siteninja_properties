class PropertySearchesController < ApplicationController
  unloadable
  before_filter :get_page
  def index
    if params[:search][:region_id].blank? and params[:search][:property_type_id].blank?
      @properties = Property.all(:joins => ['LEFT OUTER JOIN people ON people.id = properties.person_id'], :conditions => ["confirmed = ? and sold = ? and reduced_price >= ? and reduced_price <= ?", true, false, params[:min_price], params[:max_price]])
    elsif params[:search][:region_id].blank?
      @properties = Property.all(:joins => ['LEFT OUTER JOIN people ON people.id = properties.person_id'], :conditions => ["confirmed = ? and sold = ? and property_type_id = ? and reduced_price >= ? and reduced_price <= ?", true, false, params[:search][:property_type_id], params[:min_price], params[:max_price]])
    elsif params[:search][:property_type_id].blank?
      @properties = Property.all(:joins => ['LEFT OUTER JOIN people ON people.id = properties.person_id'], :conditions => ["confirmed = ? and sold = ? and region_id = ? and reduced_price >= ? and reduced_price <= ?", true, false, params[:search][:region_id], params[:min_price], params[:max_price]])
    else
      @properties = Property.all(:joins => ['LEFT OUTER JOIN people ON people.id = properties.person_id'], :conditions => ["confirmed = ? and sold = ? and property_type_id = ? and region_id = ? and reduced_price >= ? and reduced_price <= ?", true, false, params[:search][:property_type_id], params[:search][:region_id], params[:min_price], params[:max_price]])
    end
  end
  
  def create
    @search = PropertySearch.new(params[:property_search])
    if @search.save
      redirect_to :action => 'show', :id => @search.id
    else
      render :new
    end
  end
  
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
