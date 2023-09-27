require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:review) { create(:review, user: user, movie: movie) }

  before do
    sign_in user
  end

  describe "POST #create" do
    it "creates a new review" do
      review_params = attributes_for(:review, user_id: user.id, movie_id: movie.id)
      expect {
        post :create, params: { movie_id: movie.id, review: review_params }
      }.to change(Review, :count).by(1)
      expect(response).to redirect_to(movie_reviews_path(movie, assigns(:review)))
      expect(flash[:notice]).to eq('Review was successfully created.')
    end

    it "does not create a review with invalid parameters" do
      invalid_review_params = attributes_for(:review, user_id: user.id, movie_id: movie.id, rating: 6)
      expect {
        post :create, params: { movie_id: movie.id, review: invalid_review_params }
      }.not_to change(Review, :count)
      expect(response).to redirect_to(movie_reviews_path(movie, assigns(:review)))
      expect(flash[:notice]).to eq('Comment or Rating is not filled.')
    end
  end

  describe "GET #edit" do
    it "returns a successful response" do
      get :edit, params: { movie_id: movie.id, id: review.id }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    it "updates an existing review" do
      updated_review_params = { comment: "Updated comment", rating: 4 }
      patch :update, params: { movie_id: movie.id, id: review.id, review: updated_review_params }
      expect(response).to redirect_to(movie_reviews_path(movie, assigns(:review)))
      expect(flash[:notice]).to eq('Review was successfully updated.')
      expect(review.reload.comment).to eq("Updated comment")
      expect(review.reload.rating).to eq(4)
    end

    it "does not update a review with invalid parameters" do
      invalid_review_params = { comment: "", rating: 6 }
      patch :update, params: { movie_id: movie.id, id: review.id, review: invalid_review_params }
      expect(response).to render_template(:edit)
      expect(flash[:alert]).to eq('Comment or Rating is not filled.')
    end
  end
end
