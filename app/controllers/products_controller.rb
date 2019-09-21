class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def new
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end 
end
