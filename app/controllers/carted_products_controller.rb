class CartedProductsController < ApplicationController

  def create
    if current_user
      carted_product = CartedProduct.create(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "Carted")

      redirect_to :carted_products_index
    else
      redirect_to :new_user_session
    end
  end

  def index
    if current_user
      @carted_products = CartedProduct.all.where(status: "Carted")
    else
      redirect_to :new_user_session
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "Removed")
    flash[:danger] = "You have removed this item from your cart"
    redirect_to :carted_products_index
  end

end
