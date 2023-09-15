class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { need_payment: 0, checking: 1, making: 2, preparing: 3, shipped: 4 }
  
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  def subtotal
    item.with_tax_price*amount
  end
  
  #def total_payment(order)
    #orders.find_by(: item.id)
  #end
  
end
