class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def confirm
    @total = 0
    @cart_items = current_customer.cart_items
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
    @order_new = Order.new
  end
  
  def finish
  end
  
  def index
   @orders = current_customer.orders
   #@order_details = OrderDetail.all
  end  
  
  def create
   @order = Order.new(order_params)
   @order.save
   @cart_items = current_customer.cart_items
   
   @cart_items.each do |cart_item|
    @order_details = OrderDetail.new
    @order_details.item_id = cart_item.item.id
    @order_details.order_id = @order.id
    @order_details.amount = cart_item.amount
    @order_details.price = cart_item.item.with_tax_price
    @order_details.save
   end
   
   CartItem.destroy_all
   
   redirect_to orders_finish_path
  end
  
  def show
   @total = 0
   @order = current_customer.orders.find(params[:id])
  end
  
  private
  
  def order_params
   #params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_method, :total_payment)
   params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :customer_id, :postage, :status)
  end
  
  #def order_detail_params
   #params.require(:order_detail).permit(:item_id, :order_id, :amount, :price)  
  #end  
  
end
