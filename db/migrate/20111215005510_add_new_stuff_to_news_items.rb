class AddNewStuffToNewsItems < ActiveRecord::Migration
  def change
    add_column :news_items, :news_type, :integer
    add_column :news_items, :important, :boolean
  end
end
