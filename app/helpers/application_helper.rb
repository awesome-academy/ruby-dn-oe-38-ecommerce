module ApplicationHelper
  def create_index params_page, index, per_page
    params_page = 1 if params_page.nil?
    (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end

  def get_list_brand
    @brands = Brand.order_name_asc
  end

  def current_order
    if logged_in?
      if !session[:order_id].nil?
        current_user.orders.find(session[:order_id])
      else
        current_user.orders.create
      end
    else
      Order.new
    end
  end
end
