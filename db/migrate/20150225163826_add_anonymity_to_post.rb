class AddAnonymityToPost < ActiveRecord::Migration
  def change
    add_column :posts, :anonymous, :boolean, default: false
  end
end
