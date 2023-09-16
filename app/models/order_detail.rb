class OrderDetail < ApplicationRecord
  
  enum making_status: { can_not_make: 0, wait_making: 1, making: 2, completed: 3 }
  
  belongs_to :order
  belongs_to :item
  
  def subtotal
    item.with_tax_price*amount
  end
  
end
