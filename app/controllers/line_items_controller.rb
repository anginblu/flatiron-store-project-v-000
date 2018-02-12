class LineItemsController < ApplicationController

  def new

  end


  def create
    current_user.create_current_cart unless current_user.current_cart
    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart),
        notice: 'Item has been added to your cart'
    else
      redirect_to store_path, error: "That item coudn't be added to your cart"
    end
  end

end
