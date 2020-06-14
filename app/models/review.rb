class Review < ApplicationRecord

    belongs_to :user
    belongs_to :place
    validates :rating, :description, presence: true 
    scope :order_by_date, -> {order(:date)}

    accepts_nested_attributes_for :place

    validates :place, uniqueness: { scope: :user, message: "has already been reviewed by you"  }
    scope :ordered_by_name, -> { order(user: :asc) }

end
