FactoryBot.define do
  factory :favorite do
    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    urlToImage { Faker::Internet.url }
    description { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    user
  end
end