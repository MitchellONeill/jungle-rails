class ReviewsController < ApplicationController

  def create
    @current_user = current_user
    @product = Product.find(params[:product_id])
    @user = User.find_by(email: @current_user.email)
    @review = Review.new(review_params)
    @reviews = Review.where(product_id: @product.id).reverse
    @review.user_id = @current_user.id
    if @review.save
      redirect_to product_path(@product)
    else
      render :'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(Product.find(params[:product_id]))
  end


  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
