# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Event.destroy_all
User.destroy_all
Gift.destroy_all
# Wishlist.destroy_all
CATEGORIES = ["Birthday", "Wedding", "Covid", "Funeral", "Breakup"]

puts "Creating 10 users,creating 2 events per user, 1 wishlist with 1 gift and 30 gifts"
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )

  2.times do
    event = Event.create(
      event_date: Faker::Date.in_date_period,
      category: CATEGORIES.sample,
      title: Faker::Kpop.iii_groups,
      user: user
    )
    gifts = 5.times do
      Gift.create(
        name: Faker::Commerce.brand,
        gift_type: Faker::Commerce.department,
        rrp: Faker::Commerce.price(range: 0..10.0, as_string: true),
        description: Faker::Commerce.product_name,
        link: Faker::Internet.url
      )
    end
      2.times do
        Wishlist.create(
          name: "Hello World",
          event: event,
          gifts: gifts
        )

    end
  end
end
puts "Done"

# puts "Creating 30 Gifts"
# 30.times do
#   gift = Gift.create(
#     name: Faker::Commerce.brand,
#     gift_type: Faker::Commerce.department,
#     rrp: Faker::Commerce.price(range: 0..10.0, as_string: true),
#     description: Faker::Commerce.product_name,
#     link: Faker::Internet.url
#   )
