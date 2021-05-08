class CreateChatrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chatrooms do |t|
      t.integer :user_id
      t.integer :instructor_id

      t.timestamps
    end
  end
end
