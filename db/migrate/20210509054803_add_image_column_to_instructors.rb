class AddImageColumnToInstructors < ActiveRecord::Migration[5.1]
  def change
    add_column :instructors, :image, :string
  end
end
