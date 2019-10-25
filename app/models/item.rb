class Item < ApplicationRecord
  has_many :warehouses
  has_many :stores, through: :warehouses

  validates :name, :section, presence: true
  validates_uniqueness_of :name, scope: :section
end
