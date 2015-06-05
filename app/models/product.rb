class Product < ActiveRecord::Base

  def sale_message
    if price.to_i < 2
      return " Discount Item"
    else 
      return " Sale Item!!"
    end
  end

  def tax
    price.to_f * 0.09
    #Jay says not to use this
  end

  def total
    price.to_f + tax
  end
end
