class UsersController < ApplicationController
  before_action :load_user, except: [:new, :create]
  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "controllers.users_controller.welcome"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone, :address, :password,
                                 :password_confirmation)
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "controllers.users_controller.user_not_found"
    redirect_to root_path
  end
end
