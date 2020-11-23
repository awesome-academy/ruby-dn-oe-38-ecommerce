class OrderDetailsController < ApplicationController
  before_action :check, only: [:create]
  def create
    if logged_in?
      @order = current_order
      @order_detail = @order.order_details.new(order_params)
      @order.save
      session[:order_id] = @order.id
    else
      flash[:danger] = t "controllers.order_details_controller.note_login"
      redirect_to login_path
    end
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update(order_params)
    @order_details = current_order.order_details
  end

  def destroy
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.destroy
    @order_details = current_order.order_details
  end

  private
  def check
    @check_list = current_order.order_details
    @check_list.each do |f|
      if f.product_id == params[:order_detail][:product_id].to_i
        flash[:success] = t "controllers.order_details_controller.exist"
        redirect_to root_path
      end
    end
  end

  def order_params
    params.require(:order_detail).permit(:quantity, :product_id)
  end
end
