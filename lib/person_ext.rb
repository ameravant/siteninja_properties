module PersonExt

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def person_extra_methods
      has_many :properties
      include PersonExt::InstanceMethods
    end

  end

  module InstanceMethods

  end

end
ActiveRecord::Base.send(:include, PersonExt)
Person.send(:person_extra_methods)

module ProfileExt
  def self.included(base)
    base.extend(ClassMethods)
  end
  module ClassMethods
    def profile_extra_methods
      has_many :comments, :as => :commentable
      include ProfileExt::InstanceMethods      
    end
  end
  module InstanceMethods

  end
end
ActiveRecord::Base.send(:include, ProfileExt)
Profile.send(:profile_extra_methods)
