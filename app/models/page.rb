class Page < ActiveRecord::Base
  belongs_to :pageable, :polymorphic => true
  


  def route(action)
    klass = self.pageable.class.to_s.downcase
    if klass == 'person'
      klass = "people"
    elsif klass == 'opportunity'
      klass = "opportunities"
    elsif klass == 'pageitem'
      klass = "page_items/#{self.pageable.id}"
    end
    
    "/#{klass}/#{action}"
  end



end
