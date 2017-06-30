class HomeController < ApplicationController

  def index
    @recent_products = Product.recent_products
  end

end
