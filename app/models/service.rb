class Service < ActiveRecord::Base
  has_one :page, :as => :pageable
end
