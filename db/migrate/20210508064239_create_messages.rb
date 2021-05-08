class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :chatroom_id
      t.text :content
      t.string :sender_name

      t.timestamps
    end
  end
end
