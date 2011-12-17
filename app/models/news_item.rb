class NewsItem < ActiveRecord::Base
	has_many :file_uploads, :as => :uploadable
	accepts_nested_attributes_for :file_uploads, :allow_destroy => true
  default_scope :order => 'published_date ASC'

  validates :title, :published_date, :presence => true


  NEWS_TYPES = [['General', 0], 
                ['Awards',1], 
                ['Project Highlights',2],
                ['Press Release', 3]]

  def important?
    self.important == true
  end

  def get_types
    NewsItem::NEWS_TYPES
  end
end
