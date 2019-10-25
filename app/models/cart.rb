class Cart < ApplicationRecord
  belongs_to :user
  has_many :warehouseCarts
  has_many :warehouse, through: :warehouseCarts


  validates :user_id, uniqueness: true
end
