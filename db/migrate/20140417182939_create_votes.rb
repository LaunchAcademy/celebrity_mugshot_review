class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :mugshot_id, null: false

      t.timestamps
    end
    add_index :votes, [:mugshot_id, :user_id], unique: true
  end
end
