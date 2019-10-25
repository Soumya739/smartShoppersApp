class Order < ApplicationRecord
  belongs_to :user
  has_many :warehouseOrders
  has_many :warehouses, through: :warehouseOrders
end
