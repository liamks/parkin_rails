class AddImageOrderToHomePages < ActiveRecord::Migration
  def change
    add_column :home_pages, :image_order, :string
  end
end
