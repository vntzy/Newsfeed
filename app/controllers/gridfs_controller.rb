class GridfsController < ApplicationController
  def avatar
    @user = User.find params[:id]
    content = @user.avatar.read
    send_data content, type: @user.avatar.file.content_type, disposition: "inline"
    expires_in 0, public: true
  end
end