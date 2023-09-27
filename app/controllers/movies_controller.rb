class MoviesController < ApplicationController
  before_action :authenticate_user!

  # GET /movies
  def index
    # Sorting movies by max average rating
    @movies = Movie.includes(:reviews).highest_rated

    # Filtering movies by release date if start_date and end_date params are present
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @movies = @movies.released_between(start_date, end_date)
    end

    # Paginate the list of movies
    @pagy, @movies = pagy(@movies, items: 10) # This line handles pagination
  end

  # GET /movies/:id
  def show
    # Load a movie and its associated reviews and users
    @movie = Movie.includes(reviews: :user).find(params[:id])
  end

  # GET /movies/search
  def search
    if params[:search].present?
      # Search movies by name and include associated reviews
      @movies = Movie.where('name LIKE ?', "%#{params[:search]}%").includes(:reviews)
    else
      flash[:notice] = "No search term provided."
    end

    # Paginate the search results
    @pagy, @movies = pagy(@movies, items: 10)
  end
end
