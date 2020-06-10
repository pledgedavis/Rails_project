class PlacesController < ApplicationController

  def new 
    @place = Place.new  
      @place.build_category 
  end 

  def create
    # binding.pry
    @place = Place.new(place_params) 
    @place.user_id = session[:user_id] 
   if @place.save 
     redirect_to places_path(@place) 
   else
    @place.build_category  
     render :new 
   end
 end

 def update 
  @place = Place.find_by(id: params[:id])
  if @place.update(place_params)
      redirect_to places_path
  else
      render :edit
  end
 end

  def index 
    # byebug
    # binding.pry
    # @place = Place.all
    # if params[:category_id]
    #   category = Category.find(params[:category_id])
    #   @place = category.place 
    # else 
      @place = Place.order_by_rating.includes(:category) 
    # end 
  end

  def show
    @place = Place.find_by(id: params[:id])
  end

  def edit
    @place = Place.find_by(id: params[:id])
  end
  
  private 

  def place_params
      params.require(:place).permit(:name, :description, :overall_rating,  :category_id, category_attributes: [:name])
      # params.require(:post).permit(:title, ) 
  end
  # def set_place
  #     @place = Place.find_by(id: params[:id])
  #     redirect_to  places_path if !@place 
  #  end
end
