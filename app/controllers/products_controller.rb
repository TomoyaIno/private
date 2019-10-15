class ProductsController < ApplicationController
  def index
    @products = Product.all
    product_ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
    @ranking = product_ids.map { |id| Product.find(id) }
    @reviews = Review.order(created_at: :DESC).limit(3)
  end
  
  def new
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end 
end
