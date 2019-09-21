class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end
  
  def create
  end
end
