class RemovePolymorphic < ActiveRecord::Migration
  def up
    add_column :pages, :pageable_id, :integer
    add_column :pages, :pageable_type, :string
    remove_column :home_pages, :pageable_id
    remove_column :home_pages, :pageable_type
  end

  def down
  end
end
