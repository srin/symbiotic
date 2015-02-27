class AddClarificationToComment < ActiveRecord::Migration
  def change
    add_column :comments, :clarification, :boolean, default: false
  end
end
