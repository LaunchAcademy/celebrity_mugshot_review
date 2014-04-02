class CreateMugshots < ActiveRecord::Migration
  def change
    create_table :mugshots do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :description
      t.date :approximate_date

      t.timestamps
    end
  end
end
