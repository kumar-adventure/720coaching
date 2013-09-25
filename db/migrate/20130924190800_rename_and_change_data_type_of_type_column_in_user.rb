class RenameAndChangeDataTypeOfTypeColumnInUser < ActiveRecord::Migration
  def change
    rename_column :users, :type, :user_type
    change_column :users, :user_type, :string
  end
end
