class ReviewsController < ApplicationController
  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    review = cocktail.reviews.build(review_params)
    review.save
    redirect_to cocktail
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
