class StoreController < ApplicationController

  def index
    @products = Product.all
    @cart = current_cart
  end

def expand
  render :update do |page|
      page['ctrlbutton'].replace_html :partial => 'collapse'
          page['hiddendiv'].show
            end
            end

def collapse
  render :update do |page|
  page['ctrlbutton'].replace_html :partial => 'expand'
  page['hiddendiv'].hide
  end
  end
end
