class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = Message.new
    message.user = current_user
    message.posted_on = Time.new
    message.text = params[:text]
    message.save
    redirect_to url_for(:controller => :chat, :action => :dashboard)
  end

  def like
    message = Message.find(params[:id])
    message.likes << current_user
    message.save
  end

  def unlike
    message = Message.find(params[:id])
    message.likes.delete current_user
    message.save
  end

end
