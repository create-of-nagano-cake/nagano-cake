class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def confirm
    @cart_item = current_customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.last_name + current_customer.first_name 
     #@order.save
     #redirect_to orders_confirm_path
    elsif params[:order][:select_address] == "1"
     @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name
    else
     #render :confirm
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
   params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  
end
