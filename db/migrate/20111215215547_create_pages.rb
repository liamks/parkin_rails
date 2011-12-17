class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.integer :order
      t.integer :page_id

      t.timestamps
    end
  end
end
