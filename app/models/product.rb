class Product < ActiveRecord::Base
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :catgories, through: :categorized_products
  belongs_to :supplier

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
