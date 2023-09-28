class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:create, :edit, :update]
  before_action :set_review, only: [:edit, :update]
  load_and_authorize_resource # Load and authorize reviews

  # POST /movies/:movie_id/reviews
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.movie = @movie

    if @review.save
      redirect_to movie_reviews_path(@movie, @review), notice: 'Review was successfully created.'
    else
      redirect_to movie_reviews_path(@movie, @review), notice: 'Comment or Rating is not filled.'
    end
  end

  # GET /movies/:movie_id/reviews/:id/edit
  def edit
  end

  # PATCH /movies/:movie_id/reviews/:id
  def update
    if @review.update(review_params)
      redirect_to movie_reviews_path(@movie, @review), notice: 'Review was successfully updated.'
    else
      flash.now[:alert] = 'Comment or Rating is not filled.'
      render :edit
    end
  end

  private

  # Define the allowed review parameters
  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  # Find the associated movie
  def set_movie
    @movie = Movie.find(params[:movie_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Movie not found."
    redirect_to movies_path
  end

  # Find the associated review
  def set_review
    @review = Review.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Review not found."
    redirect_to movies_path
  end
end
