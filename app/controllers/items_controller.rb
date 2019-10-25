class ItemsController < ApplicationController
  before_action :redirect_user, only: [:index, :show]
  before_action :check_params, only: [:create]
  before_action :show_item, only: [:show, :destroy]

  def index
    @items = Item.all
  end

  def show
    @stores_with_the_item = @item.stores
    @warehouse_with_the_item = @item.warehouses
  end

  def new
    @stores = Store.all
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to items_path
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

private

  def item_params
    params.require(:item).permit(:name, :section)
  end

  def show_item
    @item = Item.find(params[:id])
  end

  def check_params
    params[:item][:name].capitalize!
    params[:item][:section].capitalize!
  end
end
