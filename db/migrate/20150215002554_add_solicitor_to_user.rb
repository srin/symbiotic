class AddSolicitorToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_solicitor, :boolean, default: false
  end
end
