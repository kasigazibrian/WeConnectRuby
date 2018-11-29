FactoryBot.define do
  factory :user, aliases: [:owner] do
    email Faker::Internet.email
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    username Faker::Internet.username
    gender Faker::Gender.binary_type
  end
end
