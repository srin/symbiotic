class AddTermsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :terms, :boolean, default: false
  end
end
