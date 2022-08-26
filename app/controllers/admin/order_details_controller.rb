class Admin::OrderDetailsController < ApplicationController
   before_action :authenticate_admin!
  def update
    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "in_production"
      @order.update(status: 2)
    elsif @order.order_details.production_complete.count == @order.order_details.count
      @order.update(status: 3)
    end
    redirect_to request.referer
  end

private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :name, :price, :amount, :making_status, :created_at)
  end

end
