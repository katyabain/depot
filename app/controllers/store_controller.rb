class StoreController < ApplicationController

  def index
    @products = Product.all
    @cart = current_cart
    @cart.destroy
  end

end
