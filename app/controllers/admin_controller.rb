class AdminController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    unless logged_in?
      flash[:danger] = t "controllers.admin_controller.request_login"
      return redirect_to login_path
    end

    return if is_admin?

    flash[:danger] = t "controllers.admin_controller.not_have_access"
    redirect_to root_path
  end
end
