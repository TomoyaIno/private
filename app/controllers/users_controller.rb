class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @count_reviews = user.reviews
    @reviews = user.reviews.order("created_at DESC").page(params[:page]).per(5)
  end
  
end
