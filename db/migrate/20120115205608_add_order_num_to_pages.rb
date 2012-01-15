class AddOrderNumToPages < ActiveRecord::Migration
  def change
  	remove_column :pages, :order
    add_column :pages, :order_num, :integer
  end
end
