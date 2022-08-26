class Admin::OrdersController < ApplicationController
 before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.order_details.each do |order_detail|
      @total += (order_detail.price * 1.1).floor
    end
    @total_payment = @total + @order.shipping_cost.to_i
    @order_details = @order.order_details

  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.status == "payment_confirmation"
      @order.order_details.update_all(making_status: 1)
    end
      redirect_to request.referer
  end


  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :name, :price, :amount, :making_status, :created_at)
  end


end
