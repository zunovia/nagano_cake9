class Public::ItemsController < ApplicationController
  def index
    @items_count = Item.all.where(is_active: 'true')
    @genres = Genre.all
    @item_all = Item.all.where(is_active: 'true').page(params[:page]).per(8)

  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end


end