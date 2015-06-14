class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders

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
