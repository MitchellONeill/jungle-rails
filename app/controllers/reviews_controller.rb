class ReviewsController < ApplicationController

def create
    @current_user = current_user
    @product = Product.find(params[:product_id])
    @user = User.find_by(email: @current_user.email)
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user_id = @current_user.id
    if @review.save
      redirect_to product_path(@product)
    else
      render :'product/show'
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
