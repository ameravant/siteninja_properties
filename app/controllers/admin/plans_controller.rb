class Admin::PlansController < AdminController
  
  unloadable
  before_filter :authorization
  before_filter :find_plan, :only => [:edit, :update, :destroy]
  
  def index
    add_breadcrumb "Plans"
    @plans = Plan.all
  end
  
  def edit
    add_breadcrumb "Plans", admin_plans_path
    add_breadcrumb @plan.title
  end
  
  def update
    if @plan.update_attributes(params[:plan])
      flash[:message] = "Plan updated successfully"
      if request.referrer =~ /add_multiple$/i
        redirect_to [:admin, @plan, :images]
      else
        redirect_to admin_plans_path
      end
    else
    render :action => "edit"
    end
  end
  
  def new
    add_breadcrumb "Plans", admin_plans_path
    add_breadcrumb "Create a new plan"
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(params[:plan])
    if @plan.save
      flash[:message] = "Property Type saved successfully"
      redirect_to admin_plans_path
    else
      render :action => :new
    end
  end
  
  def destroy
    @plan.destroy
    respond_to :js
  end
  
  private
  
  def authorization
    authorize(@permissions['admin'], "Admin")
  end
  
  def find_plan
    @plan = Plan.find(params[:id])
  end
  
end
