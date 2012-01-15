class HomePage < ActiveRecord::Base
  has_one :page, :as => :pageable

  has_many :file_uploads, :as => :uploadable
  accepts_nested_attributes_for :file_uploads, :allow_destroy => true

  attr_accessor :redirect_url
end
