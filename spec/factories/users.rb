# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:email) { |n| Faker::Internet.email + n.to_s }
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    username { |n| Faker::Internet.username + n.to_s }
    password Faker::Internet.password
    gender Faker::Gender.binary_type
  end
end
