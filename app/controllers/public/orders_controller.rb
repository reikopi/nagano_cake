class Public::OrdersController < ApplicationController

def new
  @order = Order.new
end

def confirm
  @cart_items = CartItem.all
  @order = Order.new
  @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  @order.payment_method = params[:order][:payment_method]

  if params[:order][:infomation] == "1"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
  elsif params[:order][:infomation] == "2"
    @order.postal_code = Address.find(params[:order][:address_id]).postal_code
    @order.address = Address.find(params[:order][:address_id]).address
    @order.name = Address.find(params[:order][:address_id]).name
  elsif params[:order][:infomation] == "3"
  @order.postal_code = params[:order][:postal_code]
  @order.address = params[:order][:address]
  @order.name = params[:order][:name]

  end
end

def create
  @order = Order.find(params[:id])
  @order = Order.new
  if @order.save
  redirect_to public_orders_complete_path
  end
end

def complete
end


def index
end

def show
end

private

    def order_params
      params.require(:order).permit(:payment_method, :own_infomation, :postal_code, :address, :name, :id, :address_id)
    end

end
