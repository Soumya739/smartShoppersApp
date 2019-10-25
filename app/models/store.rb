class Store < ApplicationRecord
  has_many :warehouses
  has_many :items, through: :warehouses

    validates :city, :location, :name, presence: true
    validates_uniqueness_of :city, scope: :location
    validates_uniqueness_of :name, scope: [:location, :city]
end
