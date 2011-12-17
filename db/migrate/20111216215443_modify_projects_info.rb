class ModifyProjectsInfo < ActiveRecord::Migration
  def up
    remove_column :projects, :client_id
    add_column :projects, :client_name, :string

    remove_column :projects, :costs
    add_column :projects, :costs, :string
  end

  def down
  end
end
