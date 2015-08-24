class ChatController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @chat_messages = Message.all
  end


end
