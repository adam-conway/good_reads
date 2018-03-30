class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating).to_f
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end
end
