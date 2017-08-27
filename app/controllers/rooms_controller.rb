class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by id: params[:id]
  end

  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new room_params
    if @room.save
      redirect_to @room
    else
      redirect_to :new
    end
  end

  private

  def room_params
    params.require(:room).permit :name
  end
end
