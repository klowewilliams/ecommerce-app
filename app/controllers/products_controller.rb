class ProductsController < ApplicationController

  def index
    @nuts = Product.all
  end
end
