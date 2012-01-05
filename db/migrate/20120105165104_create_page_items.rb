class CreatePageItems < ActiveRecord::Migration
  def change
    create_table :page_items do |t|
      t.text :content

      t.timestamps
    end
  end
end
