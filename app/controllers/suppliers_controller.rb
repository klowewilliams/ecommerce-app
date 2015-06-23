class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    supplier = Supplier.create(supplier_params)

    redirect_to "/suppliers/#{supplier.id}"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])
  end

  def update
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: supplier_id)
    @supplier.update(supplier_params)

    flash[:info] = "Supplier updated!"
    redirect_to "/suppliers/#{supplier_id}"
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :email, :phone)
  end

end
