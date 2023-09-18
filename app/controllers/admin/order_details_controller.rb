class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    @order_details = OrderDetail.all
    
    if @order_detail.making_status == OrderDetail.making_statuses.key(2)
      @order.update(status: 2)
    end  
    
    @order_details.each do |order_detail|
      if order_detail.making_status == OrderDetail.making_statuses.key(3)
        @order.update(status: 3)
      end  
    end 
    
    redirect_to admin_order_path(@order.id)
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :making_status)
  end
  
end
