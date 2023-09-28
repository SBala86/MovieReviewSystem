require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is valid with valid attributes" do
    movie = build(:movie)
    expect(movie).to be_valid
  end

  it "is not valid without a valid average_rating" do
    movie = build(:movie, average_rating: 6)
    expect(movie).not_to be_valid
  end

  it "is not valid without a valid reviews_count" do
    movie = build(:movie, reviews_count: -1)
    expect(movie).not_to be_valid
  end

end
