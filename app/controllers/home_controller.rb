class HomeController < ApplicationController

  def index
    @recent_products = Product.recent_products
    @most_reviewed = Product.most_reviewed
  end

end
