class CartsController < ApplicationController
  before_action :redirect_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :current_user_cart, only: [:index, :empty_cart]

  def index
    @warehouse_carts = @cart.warehouseCarts
  end

  def empty_cart
    @cart.warehouseCarts.each do |warehouse_cart|
      warehouse_cart.destroy
    end
    redirect_to carts_path
  end

  private

  def current_user_cart
    @cart = Cart.find_by(user_id: session[:user_id])
  end

end
