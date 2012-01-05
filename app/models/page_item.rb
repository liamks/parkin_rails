class PageItem < ActiveRecord::Base
  has_one :page, :as => :pageable
  accepts_nested_attributes_for :page, :allow_destroy => true


end
