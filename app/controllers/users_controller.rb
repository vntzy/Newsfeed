class UsersController < ApplicationController
  before_action :authenticate_user!

  def block_user
    blocked = User.find(params[:id])
    current_user.blocked_users.push blocked
    current_user.save
  end

  def profile
    @user = User.find_by(email: params[:email] + '.' + params[:format])
  end


end
