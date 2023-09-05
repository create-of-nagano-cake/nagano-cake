class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def confirm
  end
  
  def finish
  end
  
  def index
  end  
  
  def create
  end
  
  def show
  end
  
  private
  
  def order_params
   params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :total_payment)
  end
  
end
