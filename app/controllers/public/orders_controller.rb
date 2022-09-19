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
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
 @order.save
 current_customer.cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.item_id = cart_item.item_id
    @order_detail.order_id = @order.id
    @order_detail.price = cart_item.item.add_tax_price
    @order_detail.amount = cart_item.amount
    @order_detail.save
   end
   current_customer.cart_items.destroy_all
   redirect_to public_orders_complete_path
end

def complete
end


def index
  @orders = Order.all
  @order_details = OrderDetail.all
end

def show
  @order = Order.find(params[:id])
  @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.item.add_tax_price * order_detail.amount }
end

private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :billing_amount)
    end
end
