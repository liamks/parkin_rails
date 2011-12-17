class AddOrderNumToFileUploads < ActiveRecord::Migration
  def change
    add_column :file_uploads, :order_num, :integer
  end
end
