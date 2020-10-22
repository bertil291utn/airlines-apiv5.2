FactoryBot.define do
  factory :review do
    association :airline_id, factory: :airline
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    score { rand(1..10) }
  end
end
