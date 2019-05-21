class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.chatroom = Chatroom.find(params[:chatroom_id])
    authorize @message.chatroom
    if @message.save
      redirect_to chatroom_path(@message.chatroom)
    else
      render "chatroom/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
