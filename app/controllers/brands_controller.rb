class BrandsController < ApplicationController
  def index
    @per_page = Settings.paging.p_10
    @brands = Brand.order_name_asc.page(params[:page]).per(@per_page)
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new brand_params
    if @brand.save
      flash[:success] = t "brands.brand_created"
      redirect_to brands_path
    else
      render :new
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
