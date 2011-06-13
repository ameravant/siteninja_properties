module EventExt

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def event_extra_methods
      belongs_to :property
      attr_accessor :delete
      include EventExt::InstanceMethods
    end
  end

  module InstanceMethods

  end

end
ActiveRecord::Base.send(:include, EventExt)
Event.send(:event_extra_methods)