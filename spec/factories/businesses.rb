FactoryBot.define do
  factory :business do
    owner
    category
    business_name Faker::Name.name
    business_email Faker::Internet.email
    business_location Faker::Address.country
    contact_number Faker::PhoneNumber.cell_phone
    business_description Faker::Lorem.sentence
    deleted_at nil
  end
end
