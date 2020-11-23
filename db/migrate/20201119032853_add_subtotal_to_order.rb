class AddSubtotalToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :subtotal, :float
  end
end
