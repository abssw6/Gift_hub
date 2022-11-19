# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


puts "Creating 10 users"
10.times do
  object = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8))
end
puts "Done"



# puts "Creating 50 drinks"
# 10.times do
#   file = URI.open(Faker::LoremFlickr.image(search_terms: ['sodacan']))
#   i = 1
#   object = Drink.new(
#     name: Faker::Kpop.iii_groups,
#     description: Faker::Lorem.sentences,
#     stock_level: rand(50..100),
#     price: rand(2..10),
#     user: User.first
#   )
