class ProductsController < ApplicationController

  def index
    @nuts = Product.all
  end

  def show
    @nut = Product.find_by(id: params[:id])
  end

  def new
  end

  def create
    Product.create(name: params[:name], image: params[:image], price: params[:price], description: params[:description])
  end

end
