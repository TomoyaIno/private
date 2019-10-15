class RankingController < ApplicationController
  products 'index'
   before_action :ranking
  def ranking
    @ranking = Product.limit(5)
  end
end
