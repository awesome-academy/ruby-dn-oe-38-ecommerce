class BrandsController < ApplicationController
  def index
    @per_page = Settings.paging.p_10
    @brands = Brand.order_name_asc.page(params[:page]).per(@per_page)
  end
end
