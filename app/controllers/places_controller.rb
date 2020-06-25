class PlacesController < ApplicationController
  before_action :find_place, only: [:update, :show, :edit]
  def new 
    @place = Place.new  
      @place.build_category 
  end 

  def create
    # binding.pry
    @place = Place.new(place_params) 
    @place.user_id = current_user
   if @place.save 
     redirect_to places_path(@place) 
   else
    @place.build_category  
     render :new 
   end
 end

 def update 
  if @place.update(place_params)
      redirect_to places_path
  else
      render :edit
  end
 end

  def index  
    @place = Place.order_by_rating.includes(:category)
    # binding.pry
    # @place = Place.all 
  end

  def show
  end

  def edit
  end
  
  private 

  def find_place 
    @place = Place.find_by(id: params[:id])
  end

  def place_params
      params.require(:place).permit(:name, :description, :overall_rating,  :category_id, category_attributes: [:name]) 
  end
end
