class Public::CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items.all
    @total_price = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    current_cart_items = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if current_cart_items.present?
    cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
    cart_item.update!(item_count: cart_item.item_count + @cart_item.item_count)
    redirect_to public_cart_items_path
    else
    @cart_item.customer_id = current_customer.id
    @cart_item.save!
    redirect_to public_cart_items_path
    end
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items=current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end
end



  private

  def cart_item_params
  params.require(:cart_item).permit(:item_id, :item_count, :customer_id)
  end
