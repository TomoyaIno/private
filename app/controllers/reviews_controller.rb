class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end
  
  def create
    Review.create(create_params)
    redirect_to controller: :products, action: :index
  end
  
  private
  def create_params
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
