class Public::AddressesController < ApplicationController
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_cusomer.id
    @address.save
    redirect_to edit_address_path
  end
  
  def index
    @address = Address.new(address_params)
    @addresses = Address.all
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def address_params
   params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end  
  
end
