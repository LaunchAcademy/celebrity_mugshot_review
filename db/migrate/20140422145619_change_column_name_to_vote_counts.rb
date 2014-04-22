class ChangeColumnNameToVoteCounts < ActiveRecord::Migration
  def up
    remove_column :mugshots, :vote_count, :integer
    add_column :mugshots, :votes_count, :integer
  end
  def down
    add_column :mugshots, :vote_count, :integer
    remove_column :mugshots, :votes_count, :integer
  end
end
