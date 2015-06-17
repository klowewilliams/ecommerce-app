class OrdersController < ApplicationController

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    if current_user
      @carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)

      @subtotal = 0
      @tax = 0
      @total = 0
      @carted_products.each do |carted_product|
        @subtotal += carted_product.product.price * carted_product.quantity
      end
        
      @tax += @subtotal * 0.09
      @total += @subtotal + @tax

      # quantity = carted_products.quantity
      # price = Product.find_by(id: params[:product_id]).price
      # subtotal = quantity * price
      # tax = subtotal * 0.09
      # total = subtotal + tax

      order = Order.create(product_id: params[:product_id], user_id: current_user.id, subtotal: @subtotal, tax: @tax, total_price: @total) 
    end
    redirect_to "/orders/#{order.id}"
  end

end
