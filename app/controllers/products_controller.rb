class ProductsController < ApplicationController

  def index
    @products = Product.order(:name).page params[:page]
  end

end
