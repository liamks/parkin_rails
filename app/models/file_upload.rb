class FileUpload < ActiveRecord::Base
	belongs_to :uploadable, :polymorphic => true
	has_attached_file :upload, :styles => {:thumb => '80x80>'}

  default_scope :order => 'order_num ASC'
  before_create :add_order


  def add_order
    self.order_num = self.uploadable.file_uploads.length
  end

	def is_image?
    return false if self.upload_content_type.nil?
		self.upload_content_type.include?('image')
	end
end
