class Awards < ActiveRecord::Base
  has_one :page, :as => :pageable
end
