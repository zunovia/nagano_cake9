class Admin::ItemsController < ApplicationController
 before_action :authenticate_admin!

    def index
      @items = Item.all
      @items = Item.page(params[:page])
    end

    def new
      @item = Item.new
      @genres = Genre.all

    end

    def show
      @item = Item.find(params[:id])
      @genre = @item.genre
    end

    def create
      @item = Item.new(item_params)
      @item.save
      flash[:notice] = "商品の新規登録が完了しました。"
      redirect_to admin_item_path(@item)
    end


    def edit
      @item = Item.find(params[:id])
      @genres = Genre.all
    end

    def update
      @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to admin_item_path(@item)
    end

    private

    def item_params
      params.require(:item).permit(:image, :name, :introduction, :genre_id, :tax_free_price, :sales_status)
    end


end
