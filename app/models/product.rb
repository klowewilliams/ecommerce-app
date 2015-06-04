class Product < ActiveRecord::Base

  def sale_message
    if price.to_i < 2
      return " Discount Item"
    else 
      return " Sale Item!!"
    end
  end
end
