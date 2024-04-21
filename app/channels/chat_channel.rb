class ChatChannel < ApplicationCable::Channel
  def subscribed
    if params[:id].present?
      @private_chat = PrivateChat.find(params[:id])
    end

    stream_for @private_chat
  end

  def unsubscribed

  end
end
