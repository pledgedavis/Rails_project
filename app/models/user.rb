class User < ApplicationRecord
    has_secure_password #passwords validations 

    validates :name, :email, presence: true #users name and email vailidations
    validates :name, :email, uniqueness: true

end
