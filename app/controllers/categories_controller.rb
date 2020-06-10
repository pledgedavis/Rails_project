class CategoriesController < ApplicationController
    before_action :authorization_required

    def index 
        @categories = Category
    end 
end 