class ReviewsController < ApplicationController
  # def index # Only if we want to display this in separate page
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end

  # def new #if we want to display the form on new page. Otherwise, put it on Restaurant show page.
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = Review.new
  # end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
