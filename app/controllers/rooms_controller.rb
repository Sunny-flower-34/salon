class RoomsController < ApplicationController
  def new
    if user_signed_in?
    @room = Room.new
    @room.users << current_user
    # @rooms = current_user.room
    #  @nonrooms = Room.where(id: RoomUser.where.not(user_id: current_user.id).pluck(:id))
    end
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Object successfully created"
      redirect_to rooms_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end
  
  
  def index
    # @rooms = Room.all.order(:id)
    # @messages = @room.messages.includes(:user)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @user = User.find(params[:id])
end

def edit
  @room = Room.find(params[:id])
  # if user != current_user
  #   redirect_to rooms_path, alert: "不正なアクセスです"
  # end
end

def update
  @room = Room.find(params[:id])
  if @room.update(room_params)
    redirect_to rooms_path, notice: '更新できました'
  else
    render :edit
  end
end

def destroy
  @room = Room.find(params[:id])
  @room.destroy
  redirect_to rooms_path(@post)
end

private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
