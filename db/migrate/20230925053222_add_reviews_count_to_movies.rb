class AddReviewsCountToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :reviews_count, :integer, default: 0
  end
end
