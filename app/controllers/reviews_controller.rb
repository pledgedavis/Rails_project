class ReviewsController < ApplicationController
  require'pry'
  before_action :find_place, only: [:new]
  def new
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
  if find_place 
      @reviews = @place.reviews
  else
      @reviews = Review.all
  end
 end

 def show 
  @review = Review.find_by(id: params[:id])
 end 

 def reviewbycat   
    @reviews = Category.find_by_id(params[:category_id]).reviews
 end

  private 

  def find_place 
    @place = Place.find_by_id(params[:place_id])
  end

 def review_params
  params.require(:review).permit( :rating, :description, :place_id, :category_id, category_attributes: [:name])
 end
end

