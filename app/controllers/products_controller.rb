class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to :action => 'index'
    else
      render :action => 'index' 
      flash[:alert] = "Error to record data"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to :action => 'index'
      flash[:alert] = 'Deleted'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @update_product = Product.find(params[:id])
    @update_product.update(update_product_params) 
    if @update_product.save
      redirect_to :action => 'index'
    else
      render :action => 'index' 
      flash[:alert] = "Error to record data"
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def update_product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
