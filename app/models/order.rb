class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products

  validates :quantity, presence: true
  validates :quantity, numericality: true
  validates :quantity, greater_than: 0
end
