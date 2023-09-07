class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def confirm
    if @order = Order.new(order_params)
     @order.save
     redirect_to orders_finish_path
    elsif @address = Address.find([:order][:address_id])
     @address.save
     redirect_to orders_finish_path
    else 
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.first_name + current_customer.last_name
     redirect_to orders_finish_path
    end 
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
   #params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :total_payment)
   params.require(:order).permit(:payment_method)
  end
  
end
