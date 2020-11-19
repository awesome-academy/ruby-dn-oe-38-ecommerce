class PagesController < ApplicationController
  def search
    @per_page = Settings.paging.p_8
    if params[:search].blank?
      flash[:success] = t "controllers.pages_controller.empty"
      redirect_to root_path
    else
      @count_results = Product.search_by_name(params[:search])
      @results = @count_results.page(params[:page]).per(@per_page)
      @order_detail = current_order.order_details.new
    end
  end
end
