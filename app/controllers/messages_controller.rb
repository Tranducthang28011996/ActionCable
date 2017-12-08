class MessagesController < ApplicationController
  def create
    room = Room.find_by id: params[:room_id]

    if room
      @message = room.messages.build message_params
      @message.user_id = current_user.id
      @message.save
      ActionCable.server.broadcast(
        "channel_room#{room.id}",
        message: @message.content,
        id: room.id,
        name: current_user.email
      );
    end
  end

  private

  def message_params
    params.require(:message).permit :content
  end
end
