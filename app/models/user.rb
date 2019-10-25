class User < ApplicationRecord
  has_many :orders
  has_secure_password

  validates :name, :address, :contact_num, :city, presence: true
  validates :email, format: /@/
  validates :email, :contact_num, uniqueness: true
end
