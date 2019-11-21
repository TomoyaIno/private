class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @products = Product.order('created_at DESC').limit(8)
    product_ids = Review.group(:product_id).order('count_product_id DESC').limit(3).count(:product_id).keys
    @ranking = product_ids.map { |id| Product.find(id) }
    @reviews = Review.order(created_at: :DESC).limit(3)
  end
  def detail
    @products = Product.order('created_at DESC').page(params[:page]).per(9)
  end
  
  def new
    @product = Product.new
  end
  
  def create
    Product.create(product_create_params)
    redirect_to controller: :products, action: :index
  end
  
  def show
    @product = Product.find(params[:id])
  end 
  
  private
  def product_create_params
    params.require(:product).permit(:title, :image_url, :explain, :access).merge(user_id: current_user.id)
  end
end
