class PlacesController < ApplicationController

  def new 
    @place = Place.new  
      @place.build_category 
  end 

  def create
    # binding.pry
    @place = Place.new(place_params) 
    @place.user_id = current_user.id
   if @place.save 
     redirect_to places_path(@place) 
   else
    @place.build_category  
     render :new 
   end
 end

 def update 
  set_place 
  if @place.update(place_params)
      redirect_to places_path
  else
      render :edit
  end
 end

  def index  
      @place = Place.order_by_rating.includes(:category) 
  end

  def show
    set_place 
  end

  def edit
    set_place 
  end
  
  private 

  def find_place 
    @place = Place.find_by(id: params[:id])
  end

  def place_params
      params.require(:place).permit(:name, :description, :overall_rating,  :category_id, category_attributes: [:name])
     
  end
end
