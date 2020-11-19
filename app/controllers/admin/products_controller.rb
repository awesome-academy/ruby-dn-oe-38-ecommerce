class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order_by_update.order_by_create
                       .page(params[:page]).per(Settings.paging.p_10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    @product.image.attach(params[:product][:image])
    if @product.save
      flash[:info] = t "product.create_notification_success"
      redirect_to admin_products_path
    else
      flash.now[:danger] = t "product.create_notification_fail"
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :brand_id, :size_id,
                                    :describe, :image)
  end
end
