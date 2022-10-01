class Admin::OrdersController < ApplicationController

def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
  @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.item.add_tax_price * order_detail.amount }
end

def update
  @order = Order.find(params[:id])
  @order.update(status: params[:order][:status])
  redirect_to admin_order_path(@order.id)

end



end
