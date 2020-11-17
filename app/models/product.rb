class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :size
  scope :order_by_create, ->{order created_at: :desc}
  scope :order_by_update, ->{order updated_at: :desc}
  delegate :name, to: :brand, prefix: true, allow_nil: true
  delegate :name, to: :size, prefix: true, allow_nil: true
end
