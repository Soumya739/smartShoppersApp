class WarehousesController < ApplicationController
  before_action :redirect_user
  before_action :warehouse_store_item, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
    @warehouses = Warehouse.all
  end

  def new
    @stores = (Store.all).order("name")
    @items = (Item.all).order("name")
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.create(warehouse_params)
    if @warehouse.save
      redirect_to warehouse_path(@warehouse)
    else
      flash[:message] = "Invalid Input! Try again!"
      redirect_to new_warehouse_path
    end
  end

  def edit
    @stores = (Store.all).order("name")
    @items = (Item.all).order("name")
  end

  def update
    @warehouse.update(warehouse_params)
    redirect_to warehouse_path(@warehouse)
  end

  def destroy
    @warehouse.destroy
    redirect_to warehouses_path
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:item_id, :store_id, :quantity, :price)
  end

  def warehouse_store_item
      @warehouse = Warehouse.find(params[:id])
  end


end
