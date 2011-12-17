class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :title
      t.text :body
      t.date :published_date

      t.timestamps
    end
  end
end
