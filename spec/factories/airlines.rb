FactoryBot.define do
  factory :airline do
    name { Faker::Company.name }
    image_url { Faker::Avatar.image }
  end
end
