class AddTallyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :tally, :integer, default: 0
  end
end
