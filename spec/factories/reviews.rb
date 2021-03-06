# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    business
    title Faker::Lorem.word
    body Faker::Lorem.sentence
  end
end
