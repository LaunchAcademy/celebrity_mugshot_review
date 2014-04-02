class ChangeUserNameToUsername < ActiveRecord::Migration
  def up
    remove_column :users, :user_name
    add_column :users, :username, :string, null: false
  end

  def down
    remove_column :users, :username
    add_column :users, :user_name, :string, null: false
  end
end

