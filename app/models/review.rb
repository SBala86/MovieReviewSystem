class Review < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :movie, counter_cache: true

  # Validation for rating
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  # Validation for comment
  validates :comment, presence: true, length: { maximum: 500 } # maximum length

  # Callbacks
  after_save :update_movie_average_rating
  after_destroy :update_movie_average_rating

  private

  # Private method to update the average rating of the associated movie
  def update_movie_average_rating
    movie.update_average_rating
  end
end
