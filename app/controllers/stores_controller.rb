class StoresController < ApplicationController
before_action :redirect_user, only: [:about, :contact, :help, :policy, :stores_detail, :new, :show, :add_item_to_cart, :create, :edit, :destroy]

  def index
  end

  def about
  end

  def contact
  end

  def help
  end

  def policy
  end

  def stores_detail
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def show
    @store = Store.find(params[:id])
    @store_warehouses = @store.warehouses

  end

  def add_item_to_cart
    warehouse= Warehouse.find(params[:warehouse_id])
    cart = Cart.find_by(user_id: session[:user_id])
    WarehouseCart.create(warehouse_id: warehouse.id, cart_id: cart.id, quantity: 1)
    flash[:message] = "Item Added!"
    redirect_to "/stores/#{params[:id]}"
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to "/smartshoppers/stores"
    else
      flash[:message] = @store.errors.full_messages
      redirect_to "/soum73admin/smartshoppers/stores/new"
    end
  end
end






private
def store_params
  params.require(:store).permit(:name, :location, :city)
end
