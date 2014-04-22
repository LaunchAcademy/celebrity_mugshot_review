class AddVoteCountToMugshots < ActiveRecord::Migration
  def up
    add_column :mugshots, :vote_count, :integer
  end
  def down
    remove_column :mugshots, :vote_count
  end
end
