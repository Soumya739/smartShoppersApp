class WarehouseCart < ApplicationRecord
  belongs_to :cart
  belongs_to :warehouse
end
