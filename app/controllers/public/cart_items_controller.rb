class Public::CartItemsController < ApplicationController

def new
  @cart_item = CartItem.new(cart_item_params)
end

def index
  @cart_items = CartItem.all
  @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
end

def update
  @cart_item = CartItem.find(params[:id])
  @cart_item.update(amount: params[:cart_item][:amount])
  redirect_to public_cart_items_path
end

def destroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy
  redirect_to public_cart_items_path
end

def destroy_all
  CartItem.destroy_all
  redirect_to public_cart_items_path
end

def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
  if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
     cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
     cart_item.amount += params[:cart_item][:amount].to_i
     cart_item.save
     redirect_to public_cart_items_path

  elsif @cart_item.save
  redirect_to public_cart_items_path
  end
end



private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :id)
  end


end
