class Public::AddressesController < ApplicationController

def index
  @addresses = Address.all
end

def new
end

def create
end

def edit
  @address = Address.find(params[:id])
end

def update
  @address = Address.find(params[:id])
  @address.update(address_params)
  redirect_to public_adresses_path
end

def destroy
end


private
def address_params
  params.require(:address).permit(:name, :postal_code, :address)
end

end
