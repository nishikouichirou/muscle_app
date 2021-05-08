class Chatroom < ApplicationRecord
  
belongs_to :user
belongs_to :instructor
has_many :messages

end
