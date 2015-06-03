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
    product = Product.create(name: params[:name], image: params[:image], price: params[:price], description: params[:description])
    flash[:success] = "You've added a new nut! Welcome to the asylum."
    redirect_to "/products/#{product.id}"
  end

  def edit
    product_id = params[:id]
    @nut = Product.find_by(id: product_id)
  end

  def update
    product_id = params[:id]
    @nut = Product.find_by(id: product_id)
    @nut.update(name: params[:name], image: params[:image], price: params[:price], description: params[:description])
    flash[:info] = "Way to keep those nuts fresh!"
    redirect_to "/products/#{product_id}"
  end

  def destroy
    product_id = params[:id]
    @nut = Product.find_by(id: product_id)
    @nut.destroy
    flash[:danger] = "No more nut!"
    redirect_to "/products"
  end

end
