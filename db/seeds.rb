# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
Event.destory_all

puts "Creating 10 users and Creating 2 events per user"
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456")

      2.times do
          event = Event.create!(
            eventdate: Faker::Date.in_date_period,
            category: Faker::Hobby.activity,
            title: Faker::Kpop.iii_groups,
            user: user
          )
      end
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
