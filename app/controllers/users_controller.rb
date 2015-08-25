class UsersController < ApplicationController
  before_action :authenticate_user!

  def block_user
    blocked = User.find(params[:id])
    current_user.blocked_users.push blocked
    current_user.save
    render nothing: true, status: 200
  end

  def unblock_user
    blocked = User.find(params[:id])
    current_user.blocked_users.delete blocked
    current_user.save
    render nothing: true, status: 200
  end

  def profile
    @user = User.find_by(email: params[:email] + '.' + params[:format])
  end

  def change_avatar
    current_user.avatar = params[:user][:avatar]
    current_user.save
    redirect_to :back
  end

  def top_users
    @top_users = User.all.map do |u|
      blocks = u.blocked_by.size**2
      blocks = 1 if blocks == 0
      {user: u, rating: u.likes / blocks.to_f}
    end.sort_by {|user| user[:rating] }.reverse
  end

end
