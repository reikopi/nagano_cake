class Public::OrdersController < ApplicationController

def new
  @order = Order.new
end

def confirm
  @order = Order.new(order_params)
  if @order.save 
   redirect_to 
  end
end

def complete
end

def create
end

def index
end

def show
end

private

    def order_params
      params.require(:order).permit(:payment_method, :customer.own_infomation, :postal_code, :address, :name)
    end

end
