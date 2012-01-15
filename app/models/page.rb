class Page < ActiveRecord::Base
  belongs_to :pageable, :polymorphic => true
  
  default_scope :order => 'order_num ASC'
  before_create :add_order


  def add_order
    self.order_num = Page.count.length
  end

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
