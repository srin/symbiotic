class AddLinkNameToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :linkname, :string
  end
end
