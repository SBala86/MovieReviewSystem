FactoryBot.define do
  factory :review do
    rating { Faker::Number.between(from: 1, to: 5) }
    comment { Faker::Lorem.paragraph(sentence_count: 2) }
    user # This will create an associated user
    movie # This will create an associated movie

  end
end
