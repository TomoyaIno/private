class UsersController < ApplicationController
  def show
    @reviews = Review.order("created_at DESC").page(params[:page]).per(5)
  end
  
end
