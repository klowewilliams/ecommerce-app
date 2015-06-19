class Product < ActiveRecord::Base
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  belongs_to :supplier

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
  validates :price, presence: true
  validates :description, presence: true
  validates :description, uniqueness: true


  def sale_message
    if price < 2
      return " Discount Item"
    else 
      return " Sale Item!!"
    end
  end

  def tax
    price * 0.09
    #Jay says not to use this
  end

  def total
    price + tax
  end
end
