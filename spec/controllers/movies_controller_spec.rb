require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: movie.id }
      expect(response).to be_successful
    end
  end

  describe "GET #search" do
    it "returns a successful response" do
      get :search, params: { search: "Star Wars" }
      expect(response).to be_successful
    end
  end
end
