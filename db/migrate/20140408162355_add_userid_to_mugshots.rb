class AddUseridToMugshots < ActiveRecord::Migration
  def change
    add_column :mugshots, :user_id, :integer, null: false
    add_index :mugshots, :user_id
    add_index :comments, :mugshot_id
    add_index :comments, :user_id
  end
end
