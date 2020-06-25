class User < ApplicationRecord
    has_many :places 
    has_many :reviews
    # has_many :reviewed_places, through: :reviews, source: :place
    has_many :places, through: :reviews  

    
    has_secure_password #passwords validations 

    validates :name, :email, presence: true #users name and email vailidations
    validates :name, :email, uniqueness: true

    
end


