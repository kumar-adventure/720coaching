class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :integer
  	add_column :users, :payment, :string
  end
end
