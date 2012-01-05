class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.text :content

      t.timestamps
    end
  end
end
