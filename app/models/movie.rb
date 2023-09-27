class Movie < ApplicationRecord
  # Associations
  has_many :reviews, dependent: :destroy, counter_cache: true

  # Validations
  validates :average_rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :reviews_count, numericality: { greater_than_or_equal_to: 0 }

  # Scopes
  # Scope to retrieve movies sorted by average rating in descending order
  scope :highest_rated, -> { order(average_rating: :desc) }

  # Scope to retrieve movies released within a specified date range
  scope :released_between, ->(start_date, end_date) { where(release_date: start_date..end_date) }

  # Method to update the average rating of a movie based on its reviews
  def update_average_rating
    if reviews_count.positive?
      average = (reviews.sum(:rating).to_f / reviews_count).round(1)
      update_column(:average_rating, average)
    else
      update_column(:average_rating, 0.0) # Default value when no reviews are available
    end
  end
end
