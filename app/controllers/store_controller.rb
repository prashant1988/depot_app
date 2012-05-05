class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @products = Product.all
    @cart=current_cart
  end
  def destroy
    session[:user_id] = nil
    redirect_to  store_url, :notice=> "logged out"
  end
end
