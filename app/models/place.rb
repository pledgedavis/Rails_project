class Place < ApplicationRecord
    has_many :reviews 
    belongs_to :user
    belongs_to :category 
    has_many :users, through: :reviews 

    validates :name, presence: true, uniqueness: true  



    scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(overall_rating) desc')}

    accepts_nested_attributes_for :category


    # def category_attributes=(hash)
    #     category = Category.find_or_create_by(name: hash[:name])
    #     #push it into workout
    #     self.category = category
    #   end 
end
