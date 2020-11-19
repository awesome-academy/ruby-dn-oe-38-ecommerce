class ProductsController < ApplicationController
  def index
    @per_page = Settings.paging.p_8
    @products = Product.page(params[:page]).per(@per_page)
    @order_detail = current_order.order_details.new
  end

  def show
    @order_detail = current_order.order_details.new
    @product = Product.find_by id: params[:id]
    return if @product

    flash[:danger] = t "controllers.products_controller.product_not_found"
    redirect_to root_path
  end
end
