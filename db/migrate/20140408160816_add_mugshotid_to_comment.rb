class AddMugshotidToComment < ActiveRecord::Migration
  def change
    add_column :comments, :mugshot_id, :integer, null: false
  end
end
