class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = Message.where(chatroom: @chatroom)
    authorize @chatroom
  end

  def create
    # receiver = User.find(params[:receiver_id])
    # if Chatroom.where(sender: current_user, receiver: receiver)
    #   redirect_to chatroom_path(Chatroom.where(sender: current_user, receiver: receiver))
    # else
      @chatroom = Chatroom.new(chatroom_params)
      @chatroom.sender = current_user
      authorize @chatroom
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      else
        render 'dogs/show'
      end
    # end
  end

  private

  def chatroom_params
    params.permit(:receiver_id)
  end
end
