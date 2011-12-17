class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :subtitle
      t.integer :sector

      t.timestamps
    end
  end
end
