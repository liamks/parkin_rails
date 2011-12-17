class AddPolymorphicToHomePages < ActiveRecord::Migration
  def change
    add_column :home_pages, :pageable_id, :integer
    add_column :home_pages, :pageable_type, :string
  end
end
