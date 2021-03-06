class Admin::EventsController < AdminController
  unloadable # http://dev.rubyonrails.org/ticket/6001
  before_filter :authorization
  before_filter :find_event, :only => [ :edit, :update, :destroy, :restore ]

  # Configure breadcrumb
  before_filter :add_crumbs, :except => :index
  add_breadcrumb "New", nil, :only => [ :new, :create ]

  def index
    @property = Property.find(params[:property_id])
    add_breadcrumb "Properties", admin_properties_path
    add_breadcrumb @property.formatted_address, edit_admin_property_path(@property)
    if params[:q].blank?
      add_breadcrumb @cms_config['site_settings']['events_title']
      @all_events = @property.events
    else
      add_breadcrumb @cms_config['site_settings']['events_title'], "admin_events_path"
      add_breadcrumb "Search"
      @all_events = Event.find :all, :conditions => ["name like ?", "%#{params[:q]}%"], :order => "date_and_time desc"
    end
    @events = @all_events.sort_by(&:date_and_time).reverse.paginate(:page => params[:page], :per_page => 50)
  end

  def new
    @event_categories = EventCategory.active
    @event = Event.new
    @property = Property.find(params[:property_id])
  end

  def edit
    @event_categories = EventCategory.active
    add_breadcrumb @event.name
    @property = Property.find(params[:property_id])
  end

  def create
    @event = Event.new(params[:event])
    @property = Property.find(params[:property_id])
    @event.event_price_options.build(params[:event_price_options])
    @event.property_id = @property.id
    @event.person_id = current_user.person.id
    if @event.save
      if @cms_config['features']['event_registration']
        flash[:notice] = "Event created, would you like to add price options"
        redirect_to new_admin_event_event_price_option_path(@event)
      else
        flash[:notice] = "Event created"
        redirect_to [:admin, @property, :events]
      end
    else
      render :action => "new"
    end
  end

  def update
    add_breadcrumb @event.name
    @property = Property.find(params[:property_id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "#{@event.name} updated."
      redirect_to [:admin, @property, :events]
    else
      render :action => "edit"
    end
  end

  def destroy
    @event.destroy
    respond_to :js
  end

private

  def find_event
    begin
      @event = Event.find(params[:id])
    rescue
      flash[:error] = "Event not found."
      redirect_to admin_events_path
    end
  end

  def authorization
    authorize(['Property Owner', 'Admin'], "Open Houses")
  end
  def add_crumbs
    add_breadcrumb @cms_config['site_settings']['events_title'], "admin_events_path"
  end
end

