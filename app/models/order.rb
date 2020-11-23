class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :user
  before_save :set_subtotal
  enum status: {begin: 0, processing: 1, shipping: 2, delivered: 3,
                end: 4, canceled: 5}

  def subtotal
    return 0 if order_details.blank?

    order_details.map{|o| o.price * o.quantity}.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
