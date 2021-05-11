class Rename < ActiveRecord::Migration[5.1]
  def change
    rename_column :instructors, :image, :img
  end
end
