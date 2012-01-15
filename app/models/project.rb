class Project < ActiveRecord::Base
  TYPES = ['Renovation','New Facility', 'Planning Study', 
           'Prototype', 'AFP (Affirmitive Financial Procurement)',
           'Study Review', 'Addition', 'Redevelopment']

  def project_types
    Project::TYPES.map.with_index {|t,i| [t,i]}
  end

  has_many :file_uploads, :as => :uploadable
  accepts_nested_attributes_for :file_uploads, :allow_destroy => true

  attr_accessor :redirect_url
end
