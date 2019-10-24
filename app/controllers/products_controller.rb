class ProductsController < ApplicationController
  def index
    @products = Product.all
    product_ids = Review.group(:product_id).order('count_product_id DESC').limit(3).count(:product_id).keys
    @ranking = product_ids.map { |id| Product.find(id) }
    @reviews = Review.order(created_at: :DESC).limit(3)
  end
  def detail
    @products = Product.page(params[:page]).per(9)
  end
  
  def new
    @products = Product.page(params[:page]).per(9)
  end
  
  def show
    @product = Product.find(params[:id])
  end 
end
