class FileUpload < ActiveRecord::Base
	belongs_to :uploadable, :polymorphic => true
	has_attached_file :upload, :styles => {:thumb => '140x140>'}

  default_scope :order => 'order_num ASC'

	def is_image?
		self.upload_content_type.include?('image')
	end
end
