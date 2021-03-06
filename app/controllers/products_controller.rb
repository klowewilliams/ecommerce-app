class ProductsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    @nuts = Product.all
    if params[:sort]
      @nuts = Product.order(params[:sort])
    end

    if params[:sort_order]
      @nuts = Product.order(price: :desc)
      #@nuts = Product.order(params[:sort] => params[:sort_order]) -- flexible coding
    end

    if params[:discount]
      @nuts = Product.where("price < ?", 2)
    end

    if params[:category]
      @nuts = Category.find_by(name: params[:category]).products
    end
  end

  def show
    if params[:id] == "random"
      nuts = Product.all
      @nut = nuts.sample
    else
      @nut = Product.find_by(id: params[:id])
    end

    if params[:category]
      @nut = Product.find_by(name: params[:category]).products
    end
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description])

    # Image.create(product_id: @nut.id, image_url: params[:image_1]) if params[:image_1] != ""
    # Image.create(product_id: @nut.id, image_url: params[:image_2]) if params[:image_2] != ""

    if @product.save
      flash[:success] = "You've added a new nut! Welcome to the asylum."
      redirect_to "/products/#{product.id}"
    else
      render "/products/new"
    end
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

  def search
    search_term = params[:search]
    @nuts = Product.where("name LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
    #Don't look for a view to match this action
  end

  private ########################
  def authenticate_admin!
    unless user_signed_in? && current_user.admin
      redirect_to "/"
    end
  end
end