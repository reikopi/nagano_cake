class Public::AddressesController < ApplicationController

def new
  @address = Address.new
end

def index
  @address = Address.new
  @addresses = current_customer.addresses
end

def create
  @address = Address.new(address_params)
  @address.customer_id = current_customer.id
  @address.save
  redirect_to public_addresses_path
end

def edit
  @address = Address.find(params[:id])
end

def update
  @address = Address.find(params[:id])
  @address.update(address_params)
  redirect_to public_addresses_path
end

def destroy
  @address = Address.find(params[:id])
  @address.destroy
  redirect_to public_addresses_path
end


private
def address_params
  params.require(:address).permit(:name, :postal_code, :address)
end

end
