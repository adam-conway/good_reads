class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating).to_f
  end

  def highest_rated_review
    # reviews.maximum(:rating)
    reviews.find_by(rating: reviews.maximum(:rating))
  end

  def lowest_rated_review
    reviews.find_by(rating: reviews.minimum(:rating))
  end
end
