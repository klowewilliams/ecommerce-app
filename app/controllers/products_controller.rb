class ProductsController < ApplicationController

  def index
    @nuts = Product.all
  end

  def show
    @nut = Product.find_by(id: params[:id])
  end

end
