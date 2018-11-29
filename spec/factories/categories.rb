FactoryBot.define do
  factory :category, class: 'Categories' do
    name Faker::Name.first_name
  end
end
