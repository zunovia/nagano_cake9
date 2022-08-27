class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_item = CartItem.new #この記述はitem_detailのページにも記載,新規投稿のために使用
    @cart_items = current_customer.cart_items
    @total = 0   #合計金額の算出に使用する変数
  end

  def create
    #   カートモデルにレコードを新規作成する
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @have_cart = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id] )
    if @have_cart #カート内に同一商品が存在するか調べる
    # もしカート内にデータがあったなら、同一商品を足してアップデート,@have_cartで既存のカート内の商品量を取得
      @have_cart.amount = cart_item_params[:amount].to_i
      @have_cart.save
      redirect_to public_cart_items_path #投稿したらカートに遷移？
    else
      @cart_item.save
      redirect_to public_cart_items_path
    end
  end

  def update #カート内での数量変更処理
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end



  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
