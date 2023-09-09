class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  def subtotal
    item.with_tax_price*amount
  end
  
end
