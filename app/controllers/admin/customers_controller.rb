class Admin::CustomersController < ApplicationController

def index
  @customers = Customer.all
end

def show
  @customer = Customer.find(params[:id])
end

def edit
end

def update
end

private

def customer_params
  params.require(:customer).permit(:name, :name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
end




end
