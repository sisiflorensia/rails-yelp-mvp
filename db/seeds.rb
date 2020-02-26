# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all if Rails.env.development?

5.times do
  new_restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
  new_restaurant.save!
end

3.times do
  new_review = Review.new(
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    restaurant: Restaurant.all.sample
  )
  new_review.save!
end
