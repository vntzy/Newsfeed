class ChatController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    currently_blocked = current_user.blocked_users.map(&:id)
    @chat_messages = Message.where(:user.nin => currently_blocked)
                            .order_by(posted_on: 'desc')
                            .take(20).reverse
  end

  def get_old_messages
    currently_blocked = current_user.blocked_users.map(&:id)
    @chat_messages = Message.where(:user.nin => currently_blocked)
                            .order_by(posted_on: 'desc')[params[:start].to_i, 20].reverse
    render :layout => false
  end
end