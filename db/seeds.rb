# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"
require "nokogiri"

Message.destroy_all
Chatroom.destroy_all
Usercommit.destroy_all
Event.destroy_all
User.destroy_all
Gift.destroy_all

Wishlist.destroy_all
CATEGORIES = ["Birthday", "Wedding", "Babyshower", "Graduation", "Breakup", "No Reason"]


puts "Creating 10 users,creating 2 events per user, 1 wishlist with 1 gift, 30 gifts"

puts "Creating 2 test users"

koji = []

koji = User.create!(
  email: "koji@lewagon.com",
  password: "hello123",
  first_name: "Koji",
  last_name: "Samuels",
  nickname: "KJ"
)

main_event = Event.create!(
  event_date: "Fri, 17 Dec 2022 00:00:00.000000000 UTC +00:00",
  category: "Graduation",
  title: "Le Wagon Grad Party",
  user: koji
)

chatroom = Chatroom.create!(
  event: main_event,
  name: main_event.title
)

Wishlist.create!(
  name: main_event.title,
  event: main_event
  # gifts: gifts.sample(5)
)
User.create!(
  email: "abs@lewagon.com",
  password: "hello123",
  first_name: "Abdul",
  last_name: "Elmi",
  nickname: "Abs"
)

User.create!(
  email: "aziz@lewagon.com",
  password: "hello123",
  first_name: "Aziz",
  last_name: "Miah",
  nickname: "AM"
)

User.create!(
  email: "Gianluca@lewagon.com",
  password: "hello123",
  first_name: "Gianluca",
  last_name: "Galli",
  nickname: "Mac"
)


puts "done"

puts "Creating 10 users,creating 2 events per user, 1 wishlist with 1 gift and 30 gifts"

gifts = []
i = 1

# create an hash of items that we want to show and use that array
PRODUCTS = {
  Apple: ["Macbook", "Iphone", "Ipad", "Watch"],
  Beats: ["Earphones", "Headphones"],
  Microsoft: ["Surface Pro", "Surface Book"],
  Sonos: ["Sub Mini"],
  Canon: ["Camera"],
  Amazon: ["Tablet"],
  Mac: ["Foundation"],
  Bodyshop: ["Facecream", "Handcream", "Body Lotion", "Hand Sanatiser"]
}

PRODUCTS.keys.each do |company|
  products = PRODUCTS[company]
  products.each do |product|
    product_name = product
    url = "https://www.google.com/search?q=#{product_name}&tbm=isch&ved=2ahUKEwiqyv68td37AhWhTaQEHQ63D8IQ2-cCegQIABAA&oq=Lightweight+Paper&gs_lcp=CgNpbWcQAzIECCMQJzIECCMQJzIFCAAQgAQyBQgAEIAEMgYIABAIEB4yBggAEAgQHjIHCAAQgAQQGDIHCAAQgAQQGDIHCAAQgAQQGDIHCAAQgAQQGDoECAAQHlDFBFi8CWCvD2gAcAB4AIABQIgBwwKSAQE2mAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=vjyLY6rzFaGbkdUPju6-kAw&bih=796&biw=1440"
    html_file = URI.open(url)
    html_doc = Nokogiri::HTML(html_file)
    image_url = html_doc.search("body img")[10].attribute("src").value

    gift = Gift.new(
      name: "#{company} - #{product_name}",
      gift_type: "Tech",
      rrp: Faker::Commerce.price(range: 0..10.0, as_string: true),
      description: product_name,
      link: "www.#{company}.com/#{product_name}"
    )

    gift.photo.attach(io: URI.open(image_url), filename:"#{i}_image.jpg", content_type: "image/jpg")
    gift.save!

    gifts << gift
    i += 1
  end
end

n = 1

10.times do

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name


  user = User.create(
    first_name: first_name,
    last_name: last_name,
    nickname: "#{first_name[0]}#{last_name[0]}'s",
    email: Faker::Internet.email,
    password: "123456"
  )
  category = CATEGORIES.sample
    event_1 = Event.create(
      event_date: Faker::Date.forward(days: (n +2)),
      category: category,
      title: "#{user.first_name}'s #{category}",
      user: user
    )

    p event_1

    chatroom = Chatroom.create!(
      event: event_1,
      name: event_1.title
    )

    event_2 = Event.create!(
      event_date: Faker::Date.forward(days: (n +4)),
      category: category,
      title: "#{user.first_name}'s #{category}",
      user: user
    )
    p event_2

    chatroom = Chatroom.create!(
      event: event_2,
      name: event_2.title
    )

    Wishlist.create!(
      name: "Hello World",
      event: event_1,
      gifts: gifts.sample(6)
    )
    Wishlist.create!(
      name: "Hello World",
      event: event_2,
      gifts: gifts.sample(7)
    )
  n = n + 4
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
