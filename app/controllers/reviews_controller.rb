class ReviewsController < ApplicationController
  require'pry'
  def new
     set_place 
      @review = @place.reviews.build
 end

 def create
    @review = current_user.reviews.build(review_params)
  if @review.save
      redirect_to reviews_path(@review)
  else
      flash[:error] = "Place has to exist to have a review! "
      redirect_to places_path
  end
 end

 def index
  if set_place 
      @reviews = @place.reviews
  else
      @reviews = Review.all
  end
 end

 def reviewbycat   
    @reviews = Category.find_by_id(params[:category_id]).reviews
 end

  private 

  def set_place 
    @place = Place.find_by_id(params[:place_id])
  end

 def review_params
  params.require(:review).permit( :rating, :description, :place_id, :category_id, category_attributes: [:name])
 end
end

