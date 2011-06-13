class ProfilesController < ApplicationController
  unloadable
  def create
    @person = Person.new(params[:person]) 
    profile = Profile.new(params[:profile])
    params[:person][:user_attributes].merge!({ :name => params[:person][:name], :email => params[:person][:email] })
    params[:person][:person_group_ids] ||= []
    @person.confirmed = !@cms_config['site_settings']['member_confirmation']
    @person.person_group_ids = @person.person_group_ids << PersonGroup.find_by_title("Property Owner").id
    if @person.save
      profile.person_id = @person.id
      profile.save
      if Page.find_by_permalink("profile-checkout")
        redirect_to "/profile-checkout"
        flash[:notice] = "We appreciate the opportunity to help you in selling your property. Your posts will take up to 24 hours to display on our website.  If you have any questions, please contact us at support@justguideme.com. Thank you for posting on justguideme.com."
      else
        redirect_to new_session_path
        flash[:notice] = "We appreciate the opportunity to help you in selling your property. Your post will take up to 24 hours to display on our website. If you have any questions, please contact us at support@justguideme.com. Thank you for posting on justguideme.com. Please sign-in below."
      end
    else
      render :action => "new"
    end
  end
end