class Place < ApplicationRecord
    has_many :reviews 
    has_many :reviews, through :users
end
