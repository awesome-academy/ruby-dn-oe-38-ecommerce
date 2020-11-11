module ApplicationHelper
  def get_list_brand
    @brands = Brand.order_name_asc
  end
end
