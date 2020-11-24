class UsersController < ApplicationController
  before_action :load_user, :correct_user

  def show; end

  private

  def correct_user
    return if current_user?(@user)

    flash[:danger] = t "users.refuse_action"
    redirect_to root_path
  end

  def load_user
    @user = User.find_by(id: params[:id])
    return if @user

    flash[:warning] = t "users.user_not_found"
    redirect_to root_path
  end
end
