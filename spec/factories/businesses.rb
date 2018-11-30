# frozen_string_literal: true

FactoryBot.define do
  factory :business do
    association :user, factory: :user
    association :category, factory: :category
    sequence(:business_name) { |n| Faker::Company.name + n.to_s }
    sequence(:business_email) { |n| Faker::Internet.email + n.to_s }
    business_location { Faker::Address.country }
    sequence(:contact_number) { |n| "256781#{n}9#{n + 1}3#{Faker::Number.digit}" }
    business_description { Faker::Lorem.sentence }
    deleted_at { nil }
  end
end
