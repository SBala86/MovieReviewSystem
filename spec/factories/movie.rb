FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    release_date { Faker::Date.between(from: 10.years.ago, to: Date.today) }
    average_rating { Faker::Number.between(from: 1, to: 5) }
    reviews_count { Faker::Number.between(from: 0, to: 100) }
  end
end
