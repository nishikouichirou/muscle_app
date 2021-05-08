class StaticPagesController < ApplicationController
  
  def home
    @instructors = Instructor.paginate(page: params[:page])
    @instructors = Instructor
    @chatroom = Chatroom.new
    @users = []
    if current_instructor
      rooms = current_instructor.chatrooms
      rooms.each do |room|
        @users << room.user
      end
    end
  end
end
