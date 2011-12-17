class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :client_id
      t.text :name
      t.string :description
      t.integer :project_type
      t.integer :area
      t.string :city
      t.string :province
      t.integer :costs
      t.string :completion_date
      t.boolean :is_renowned

      t.timestamps
    end
  end
end
