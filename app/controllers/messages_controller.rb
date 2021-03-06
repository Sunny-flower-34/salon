class MessagesController < ApplicationController
  before_action :set_room

  def index
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end
  
  def create
    @message = @room.messages.new(message_params)
    if @message.save
      @currentuser_id = current_user.id
      @userimg = @message.user.profile_image_id
      respond_to do |format|
        format.html { redirect_to room_messages_path(@room), notice: "メッセージを送信しました" }
        format.json
      end
      # redirect_to group_messages_path(@room), notice: "メッセージを送信しました"
    else
      @messages = @room.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
