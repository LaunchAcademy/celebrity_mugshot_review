class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
