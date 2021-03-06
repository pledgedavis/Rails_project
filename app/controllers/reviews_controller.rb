class ReviewsController < ApplicationController
  require'pry'
  before_action :find_place, only: [:new]
  def new
    # binding.pry
     @review = @place.reviews.build
  end

  def create
    # binding.pry
    @review = Review.new(review_params)
         @review.user_id = current_user
  if @review.save
      redirect_to reviews_path(@review)
  else
      flash[:error] = "Place has to exist to have a review! "
      render :new 
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
  # binding.pry
  @category_name = Category.find_by(id: params[:category_id])

    @category = Category.find_by(params[:name])
    # @reviews = Review.find_by_id(params[:id])
 end

  private 

  def find_place 
    @place = Place.find_by_id(params[:place_id])
  end

 def review_params
  params.require(:review).permit( :rating, :description, :place_id, :category_id, category_attributes: [:name])
 end
end

