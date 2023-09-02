class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
    @total = 0
  end
  
  def create
    @item = Item.find(params[:item_id])
    @cart_item = current_customer.has_in_cart(@item.id)
    if @cart_item
     @cart_item.amount+cart_item_params[:amount]
    else 
     @cart_item = current_customer.cart_items.new(cart_item_params) 
     @cart_item.item_id = @item.id
     if @cart_item.save
      redirect_to cart_items_path
     else
      @cart_items = CartItem.all  
      render :index  
     end  
  end  
  
  def update 
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
