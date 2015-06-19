class CartedProductsController < ApplicationController

  def index
    if user_signed_in? && current_user.carted_products.where(status: "carted").any?
      @carted_products = current_user.carted_products.where(status: "carted")
    else
      flash[:warning] = "You have no items in your shopping cart."
      redirect_to "/"
    end
  end

  def create
    @carted_product = CartedProduct.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "Carted")
    @nut = Product.find_by(id: params[:product_id])

    if @carted_product.save
      redirect_to "/carted_products"
    else
      render "/products/show"
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "Removed")
    flash[:danger] = "You have removed this item from your cart"
    redirect_to :carted_products
  end
end