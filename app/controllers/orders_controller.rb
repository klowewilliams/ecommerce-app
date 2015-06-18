class OrdersController < ApplicationController
  SALES_TAX = 0.09
  #sets a constant although it is not normally in the Controller per Jay

  def show
    @order = Order.find_by(id: params[:id])
  end

  #after this works it should be move to the Model instead of being in the Controller (this is the non-elegant version)
  def create
    if current_user
      @carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)

      @subtotal = 0
      @tax = 0
      @total = 0
      @carted_products.each do |carted_product|
        @subtotal += carted_product.product.price * carted_product.quantity
      end
        
      @tax = @subtotal * SALES_TAX
      @total = @subtotal + @tax

      # quantity = carted_products.quantity
      # price = Product.find_by(id: params[:product_id]).price
      # subtotal = quantity * price
      # tax = subtotal * 0.09
      # total = subtotal + tax

      order = Order.create(user_id: current_user.id, subtotal: @subtotal, tax: @tax, total_price: @total) 

      @carted_products.each do |carted_product|
        carted_product.update(status: "Purchased", order_id: order.id)
      end

    end
    redirect_to "/orders/#{order.id}"
  end

end
