class Admin::OrderDetailsController < ApplicationController

def update
  @order_detail = OrderDetail.find(params[:id])
  @order_detail.update(making_status: params[:order_detail][:making_status])
  redirect_to admin_order_path(@order_detail.order.id)
end


end
