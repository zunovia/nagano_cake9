class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    #@new_items = Item.where(is_active: 'true').last(5)
  end
end