# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    @private_chat = PrivateChat.find(params[:id]) if params[:id].present?

    stream_for @private_chat
  end

  def unsubscribed; end
end
