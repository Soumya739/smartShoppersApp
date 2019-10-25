class OrdersController < ApplicationController
  before_action :redirect_user, only: [:index, :show, :convert_cart_to_order]
  before_action :current_user_orders, only: [:index, :show, :convert_cart_to_order]

  def index
  end

  def show
    @order = Order.find(params[:id])
    @warehouse_orders = @order.warehouseOrders
  end

  def convert_cart_to_order
    cart = Cart.find_by(user_id: session[:user_id])
    @order = Order.create(user_id: session[:user_id])
    if cart.warehouseCarts.any?
      cart.warehouseCarts.each do |warehouse_cart|
        warehouse_cart.warehouse.update(quantity: (warehouse_cart.warehouse.quantity  - warehouse_cart.quantity))
        WarehouseOrder.create(order_id: @order.id, warehouse_id: warehouse_cart.warehouse_id, quantity: warehouse_cart.quantity)
        warehouse_cart.destroy
      end
      redirect_to "/orders/#{@order.id}"
    else
      flash[:message] = "Your cart is empty"
      redirect_to "/carts"
    end
  end
  #
  # def review_order
  #<h4><%= link_to "Review", controller: "orders", action: "review_order_path", id: @order.id %></h4>
  # end

private
  def current_user_orders
    @current_user = User.find(session[:user_id])
    @current_user_orders = @current_user.orders
  end


end
