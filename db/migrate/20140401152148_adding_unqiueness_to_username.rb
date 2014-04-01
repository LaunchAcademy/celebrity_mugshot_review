class AddingUnqiuenessToUsername < ActiveRecord::Migration
  def up
    change_column :users, :username, :string, null: false, unique: true
  end

  def down
    change_column :users, :username, :string, null: false
  end
end
