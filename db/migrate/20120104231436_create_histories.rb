class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.text :content

      t.timestamps
    end
  end
end
