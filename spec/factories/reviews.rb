FactoryBot.define do
  factory :review do
    airline
    user
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    score { rand(1..10) }
  end
end
