class Project < ActiveRecord::Base
  TYPES = ['Renovation','New Facility', 'Planning Study', 
           'Prototype', 'AFP (Affirmitive Financial Procurement)',
           'Study Review', 'Addition', 'Redevelopment']

  def project_types
    Project::TYPES.map.with_index {|t,i| [t,i]}
  end
end
