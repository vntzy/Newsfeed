class ChatController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    currently_blocked = current_user.blocked_users.map(&:id)
    @chat_messages = Message.where(:user.nin => currently_blocked)
                            .order_by(posted_on: 'asc')
                            .take 20
  end
end