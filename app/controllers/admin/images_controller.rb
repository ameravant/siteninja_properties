class Admin::ImagesController < AdminController
  unloadable # http://dev.rubyonrails.org/ticket/6001
  before_filter :authorization
  before_filter :find_viewable
  before_filter :find_image, :except => [ :new, :create, :reorder, :index, :add_multiple ]
  def add_multiple
    if @owner.images.any?
      @images = @owner.images
    else
      @images = @owner.images.build
    end
  end
  def index
    add_breadcrumb "Images"
    @images = @owner.images.sort_by(&:position)
    if @owner.images_count.blank?
      redirect_to [:new, :admin, @owner, :image]
    end
  end

  def new
    add_breadcrumb "Images", [:admin, @owner, :images]
    add_breadcrumb "New"
    @image = @owner.images.new
  end
  
  def create
    @image = @owner.images.build(params[:image])
    @image.position = @owner.images.size + 1
    if @image.save
      added_to = @title
      redirect_path = [:admin, @owner, :images]
      flash[:notice] = "Image added to #{added_to}"
      redirect_to redirect_path
    else
      render :action => "new"
    end
  end

  def edit
    add_breadcrumb "Images", [:admin, @owner, :images]
    add_breadcrumb "Edit"
  end
  
  def update
    if @image.update_attributes(params[:image])
      @image = @owner.images.build(params[:image])
      added_to = @owner.title
      redirect_path = [:admin, @owner, :images]
      flash[:notice] = "Image updated!"
      redirect_to redirect_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @image.destroy
    respond_to :js
  end
    
  def reorder
    params["images"].each_with_index do |id, position|
      Image.update(id, :position => position + 1)
    end
    render :nothing => true
  end
  
  private
  
    def find_viewable
      # begin
        params.keys.each do |l|
          if !l.to_s.scan(/\w*_id/).blank?
            @klass = l.to_s.scan(/\w*_id/).to_s.gsub("_id","")
            break
          end
        end
        if @klass == "page"
          @owner = @klass.classify.constantize.find_by_permalink(params["#{@klass}_id".to_sym])          
        else
          @owner = @klass.classify.constantize.find(params["#{@klass}_id".to_sym])
        end
        add_breadcrumb @owner.title, [:edit, :admin, @owner]
      # rescue
      #   flash[:error] = "Owner not found."
      #   redirect_to admin_path
      # end
    end
    
    def find_image
      @image = Image.find params[:id]
    end
    
    def authorization
      authorize(['Property Owner', 'Admin'], "Images")
    end
    
end
