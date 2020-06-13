class ReviewsController < ApplicationController
  require'pry'
  # before_action :authorization_required
  # before_action :redirect_if_not_logged_in 
  def new
    # if
       @place = Place.find_by_id(params[:place_id])
      @review = @place.reviews.build
    # else
    #   # set_review
    #   # @review = Place.new
    #   # binding.pry
    # # def new
    #   # byebug
    #   @review = Review.new
    # end
 end

 def create
      # @review = Review.new(review_params)
    @review = current_user.reviews.build(review_params)
  if @review.save
      redirect_to reviews_path(@review)
    # else 
    #   render :new
  else
      flash[:error] = "Place has to exist to have a review! "
      redirect_to places_path
  end
 end

 def show
    @review = Place.find_by_id(params[:id])
    # set_review
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
# def set_review
#   @review = Review.find_by(id: params[:id])
#   if !@review
#     redirect_to reviews_path
#   end
# end
 def review_params
  params.require(:review).permit( :rating, :description, :place_id)
    # :count, :rating, :picture, :description, :date, :place_id, :user_id, place_attributes: [:name])
  # , :location, :description
 end
end

