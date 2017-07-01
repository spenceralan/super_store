class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "The review has been added."
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    product = Product.find(params[:product_id])
    Review.find(params[:id]).destroy
    flash[:notice] = "The review has been updated."
    redirect_to product_path(product)
  end

private
  def review_params
    params.require(:review).permit(:username, :content, :rating)
  end

end