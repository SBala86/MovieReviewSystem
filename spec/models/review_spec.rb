require 'rails_helper'

RSpec.describe Review, type: :model do
  it "is valid with valid attributes" do
    review = build(:review)
    expect(review).to be_valid
  end

  it "is not valid without a valid rating" do
    review = build(:review, rating: 6)
    expect(review).not_to be_valid
  end

  it "is not valid without a valid comment" do
    review = build(:review, comment: "a" * 501)
    expect(review).not_to be_valid
  end

end
