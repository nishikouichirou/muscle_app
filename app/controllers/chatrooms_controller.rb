class ChatroomsController < ApplicationController
  
  def show
    @chatroom_id = params[:id]
    @message = Message.new
    chatroom = Chatroom.find(params[:id])
    @messages = chatroom.messages.order(created_at: :desc)
  end
  
  def create_room
    if params[:user_id] && params[:instructor_id]
      exist_chatroom = Chatroom.find_by(user_id: params[:user_id], instructor_id: params[:instructor_id])
      if !exist_chatroom.present?
        chatroom = Chatroom.new
        chatroom.user_id = params[:user_id]
        chatroom.instructor_id = params[:instructor_id]
        chatroom.save
        redirect_to chatroom_path(id: chatroom)
      else
        redirect_to chatroom_path(id: exist_chatroom)
      end
    end
  end
  
  def create_message
    message = Message.new
    message.sender_name = params[:sender_name]
    message.chatroom_id = params[:chatroom_id]
    message.content = params[:message][:content]
    message.save
    redirect_to chatroom_path(params[:chatroom_id])
  end
  
end
