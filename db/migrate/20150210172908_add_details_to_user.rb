class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :SRA_number, :string, default: ""
    add_column :users, :verified, :boolean, default: false
  end
end
