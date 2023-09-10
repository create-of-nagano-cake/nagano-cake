class Admin::OrdersController < ApplicationController
  
  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
    @total = 0
  end
  
  private
  
  def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :customer_id, :postage)
  end
  
end
