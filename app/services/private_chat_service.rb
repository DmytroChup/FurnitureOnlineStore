class PrivateChatService
  def initialize(user, producer)
    @user = user
    @producer = producer
  end

  def find_or_create_chat
    private_chat = PrivateChat.get_private_chat(@user.id, @producer.id)

    unless private_chat
      private_chat = PrivateChat.create(user: @user, producer: @producer)
    end

    private_chat
  end
end