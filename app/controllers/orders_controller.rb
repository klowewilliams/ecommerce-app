class OrdersController < ApplicationController
  
  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    quantity = params[:quantity].to_i
    price = Product.find_by(id: params[:product_id]).price
    subtotal = quantity * price
    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.create(quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, subtotal: subtotal, tax: tax, total_price: total)
    redirect_to "/orders/#{order.id}"
  end

end
