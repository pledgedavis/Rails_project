class Category < ApplicationRecord
    has_many :places 
    has_many :reviews, through: :places
    validates :name, presence: true, uniqueness: true
end