# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :find_private_chat

  def create
    @message = @private_chat.messages.new(message_params)
    if current_user
      @message.profile = current_user
    elsif current_producer
      @message.profile = current_producer
    end


    if @message.save
      ChatChannel.broadcast_to(
        @message.private_chat,
        render_to_string(partial: "message", locals: {message: @message})
      )
    end

    head :ok
  end

  private

  def find_private_chat
    @private_chat = PrivateChat.find(params[:private_chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
