class Review < ApplicationRecord
    require'pry'
    belongs_to :user
    belongs_to :place

    scope :order_by_date, -> {order(:date)}

    accepts_nested_attributes_for :place

    # def place_attributes=(name)
    #     binding.pry
    #     # place = Place.find_or_create_by(name: attr_hash[:name])
    #     # self.place = place
    #     self.place = Place.find_or_create_by(name: name)
    #     self.place = place
    #     # place = Place.find_or_create_by(attr_hash)
    # end

    validates :place, uniqueness: { scope: :user, message: "has already been reviewed by you"  }
    scope :ordered_by_name, -> { order(user: :asc) }


  # def place_attributes
  #   self.place? self.place.attr_hash :nil
  # end
end
