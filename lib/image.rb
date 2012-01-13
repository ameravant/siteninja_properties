class Image < ActiveRecord::Base
  require "#{Rails.root}/vendor/plugins/siteninja/siteninja_core/app/models/image"
  has_attached_file :image, {:styles => { :icon => "32x16>", :thumb => "48x36#", :square => "75x75#", :small => "85x55#", :medium_thumb => "156x120#", :large_thumb => "176x145#", :medium => "200x9999>", :large => "880x9999>", :slide => "#{!CMS_CONFIG['site_settings']['feature_box_width'].blank? ? CMS_CONFIG['site_settings']['feature_box_width'] : '550'}x9999>", :wide_slide => "#{!CMS_CONFIG['site_settings']['wide_feature_box_width'].blank? ? CMS_CONFIG['site_settings']['wide_feature_box_width'] : '870'}x9999>" }}.merge(PAPERCLIP_OPS)
  validates_presence_of :title, :on => :create
end
