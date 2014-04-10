class AddImageToMugshot < ActiveRecord::Migration
  def up
    add_column :mugshots, :image, :string
  end
  def down
    remove_column :mugshots, :image
  end
end
