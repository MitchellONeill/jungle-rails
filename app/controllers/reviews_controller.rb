class ReviewsController < ApplicationController

  def create
    @reviewer = current_user
    @product = Product.find(params[:product_id])
    @user = User.find_by(email: @current_user.email)
    params["review"]["rating"] = params["review"]["rating"].to_i
    @review = Review.new(review_params)
    @review.user_id = @reviewer.id
    @review.product_id = @product.id

    if @review.save
      redirect_to product_path(@product)
    else
      render :'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to product_path(Product.find(params[:product_id]))
    else
      render :'products/show'
    end

  end


  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
