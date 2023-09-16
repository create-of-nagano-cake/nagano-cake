class Admin::OrdersController < ApplicationController
  
  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
    @total = 0
  end
  
  def update
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
    @order.update(order_params)
    
    if @order.status == Order.statuses.key(1)
      #@order_details.making_statuses.update
      @order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end  
    end 
    
    redirect_to admin_order_path(@order.id)
    
  end
  
  private
  
  def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :customer_id, :postage, :status)
  end
  
end
