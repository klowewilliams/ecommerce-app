class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products

  
end
