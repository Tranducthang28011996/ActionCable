class RoomChannel < ApplicationCable::Channel
  def subscribed
    room_channel = "channel_room#{params[:room]}"
    stream_from room_channel

  end

  def receive(payload)
    Message.create(user: current_user, chatroom_id: params["room"], content: payload["message"])
  end

  def unsubscribed
  end
end
