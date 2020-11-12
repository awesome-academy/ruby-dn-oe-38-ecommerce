class Brand < ApplicationRecord
  scope :order_name_asc, ->{order :name}
end
