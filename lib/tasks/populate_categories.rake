namespace :populate_categories do
  desc 'Populating the table with sample categories'
  task populate_sample_categories: :environment do
    categories = [
        'Education', 'Automobiles',
        'Real Estate', 'Education',
        'Health and Medicine',
        'Computer and Electronics',
        'Food retail and service',
        'Beauty and Fragrances',
        'Sports and Outdoors'
    ]
    categories.each do |category|
      c = Category.new(name: category)
      c.save
    end
  end
end
