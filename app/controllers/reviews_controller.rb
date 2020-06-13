class ReviewsController < ApplicationController
  require'pry'
  def new
       @place = Place.find_by_id(params[:place_id])
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

 def show
    @review = Place.find_by_id(params[:id])
 end

 def index
  # binding.pry
  if @place = Place.find_by_id(params[:place_id])
      @reviews = @place.reviews
  else
      # binding.pry
      @reviews = Review.all
     
  end
 end

 def reviewbycat
  # binding.pry
  @reviews = Review.all
  # binding.pry
 end

  private 
 def review_params
  params.require(:review).permit( :rating, :description, :place_id)
 end
end

