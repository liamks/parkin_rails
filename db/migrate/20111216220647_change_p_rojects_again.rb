class ChangePRojectsAgain < ActiveRecord::Migration
  def up
    remove_column :projects, :name
    add_column :projects, :name, :string

    remove_column :projects, :description
    add_column :projects, :description, :text
  end

  def down
  end
end
