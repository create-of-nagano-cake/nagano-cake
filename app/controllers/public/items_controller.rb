class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @items = Item.where(is_active: true).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
