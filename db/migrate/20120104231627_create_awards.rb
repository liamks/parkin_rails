class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.text :content

      t.timestamps
    end
  end
end
