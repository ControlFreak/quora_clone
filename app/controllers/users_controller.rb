class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def follow_user
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

end
