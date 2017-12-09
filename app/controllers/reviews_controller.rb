class ReviewsController < ApplicationController
   before_action :require_login, only: [:destroy]

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: "Review was successfully created."
    else
      render @product
    end
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.product, notice: 'Review successfully deleted'
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
    end
  end

end
