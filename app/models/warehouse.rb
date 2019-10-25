class Warehouse < ApplicationRecord
  belongs_to :item
  belongs_to :store
  has_many :warehouse_carts
  has_many :warehouse_orders
  has_many :carts, through: :warehouseCarts
  has_many :orders, through: :warehouseOrders

  validates :item_id, :store_id, :quantity, :price, presence: true
  validates_uniqueness_of :item_id, scope: :store_id
end
