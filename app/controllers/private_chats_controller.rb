# frozen_string_literal: true

class PrivateChatsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :authenticate_producer!
  before_action :find_private_chat, only: [:show]

  def index
    if current_user
      @profile = current_user
      @private_chats = PrivateChat.where("user_id = ?", @profile.id).order("created_at DESC")
    elsif current_producer
      @profile = current_producer
      @private_chats = PrivateChat.where("producer_id = ?", @profile.id).order("created_at DESC")
    else
      redirect_to "/home/index", notice: "Please log in first."
    end
  end

  def show
    current_profile = current_user || current_producer
    @private_chat = PrivateChat.find(params[:id])
    @profile = if current_profile == @private_chat.user
                 @private_chat.producer
               else
                 @private_chat.user
               end
    @message = Message.new
  end

  private

  def find_private_chat
    @private_chat = PrivateChat.find(params[:id])
  end

  def private_chat_params
    params.require(:private_chat).permit(:user_id, :producer_id)
  end
end
