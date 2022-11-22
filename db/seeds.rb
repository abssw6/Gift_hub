# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all
CATEGORIES= ["Birthday", "Wedding", "Covid", "Funeral", "Breakup"]

puts "Creating 10 users and Creating 2 events per user"
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456")

      2.times do
          event = Event.create(
            eventdate: Faker::Date.in_date_period,
            category: CATEGORIES.sample,
            title: Faker::Kpop.iii_groups,
            user: user
          )
      end
end
puts "Done"
