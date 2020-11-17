class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  scope :order_name_asc, ->{order :name}
end
