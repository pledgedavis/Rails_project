class Place < ApplicationRecord
    has_many :reviews 
    belongs_to :user
    belongs_to :category 
    has_many :users, through: :reviews 

    validates :name, presence: true, uniqueness: true  



    scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(overall_rating) desc')}

    accepts_nested_attributes_for :category

end
