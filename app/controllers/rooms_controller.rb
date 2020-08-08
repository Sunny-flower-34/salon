class RoomsController < ApplicationController
   def new
    @room = Room.new
    @room.users << current_user
  end
  
  def create
    @room = Room.new(group_params)
    if @room.save
      flash[:success] = "Object successfully created"
      redirect_to @room
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  
  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
end

private

  def group_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
