class History < ActiveRecord::Base
  has_one :page, :as => :pageable
end
