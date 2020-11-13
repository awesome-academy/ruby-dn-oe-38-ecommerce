class ProductsController < ApplicationController
  def index
    @products = Product.order_by_update.order_by_create.page params[:page]
  end
end
