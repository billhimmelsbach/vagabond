# require 'ffaker'
#
# User.destroy_all
# City.destroy_all
# Post.destroy_all
#
# Post = [
#   {
#     title: "If You're Visiting San Francisco, You Have To Get THIS BURRITO.",
#     content: "El Faralito has the best burritos in SF, HANDS DOWN. Bonus: they are open crazy late for those times when all you need is a burrito after a great rock concert.",
#     image: "http://winstonwanders.com/wp-content/uploads/2014/11/DSC_5524_edit-700x393.jpg",
#     user_id: 2,
#     city_id: 1
#   },
#   {
#     title: "There Are a Thousand Ice Cream Shops in SF... but Only One Bi-Rite!!!",
#     content: "Bi-rite ice cream will change the way you think about Ice Cream. If you're traveling through SF, take a minute to experience ice cream the way ice cream was always meant to be: simple and delicious.",
#     image: "https://mynikoneatsfood.files.wordpress.com/2011/02/dsc_7337.jpg",
#     user_id: 3,
#     city_id: 1
#   },
#   {
#     title: "Two Words: Pug. Woodstock.",
#     content: "On the first Sunday of every month at Alta Plaza Park, something magical happens. Pug Woodstock. Everyone in the area brings their pugs in for a giant sea of pugs. A pug sea. HOW CAN YOU RESIST?",
#     image: "http://s3-media1.fl.yelpcdn.com/bphoto/CKabJysnNNF33cKjaAWKtQ/348s.jpg",
#     user_id: 1,
#     city_id: 1
#   }
# ]
#
# User = [
#   {
#     first_name: "Kathleen",
#     last_name: "Hanna",
#     email: "khanna@test.com",
#     current_city: "San Francisco",
#     password_digest: "$2a$10$Dnb1rMCPOFcQfSKDPdVXY.G.xkWyTus6liF3q5Q1.fB/AAIQgSZFu",
#     image_url: "http://assets.rollingstone.com/assets/images/story/kathleen-hanna-moves-forward-with-the-julie-ruin-20130904/hanna-306-1378408387.jpg"
#   },
#   {
#     first_name: "Frank",
#     last_name: "Ocean",
#     email: "focean@test.com",
#     current_city: "New Orleans",
#     password_digest: "$2a$10$S5dx9iu1Sx.SPP7J/itQ7uPwW4j8mC50e0xsP/tRjCrsrlI0uwFxC",
#     image_url: "http://cdn.pitchfork.com/tracks/17293/homepage_large.8a0c1ce3.jpg"
#   },
#   {
#     first_name: "Ada",
#     last_name: "Lovelace",
#     email: "alovelace@test.com",
#     current_city: "London",
#     password_digest: "$2a$10$0d8Wig5YbVC7wlOfz61nVeg81i19VSN9vsbVjhIOSUQHVMtgRGDCq",
#     image_url: "http://i.imgur.com/ixpF82Y.png"
#   }
# ]
#
# City = [
#   {
#     name: "San Francisco",
#     image: "http://cats2010.com/wp-content/uploads/2014/09/Untitled_Panorama4-2.jpg "
#   },
#   {
#     name: "London",
#     image: "https://media.licdn.com/mpr/mpr/p/4/005/06e/30b/3b8b905.jpg"
#   },
#   {
#     name: "Gibraltar",
#     image: "http://www.visitgibraltar.gi/images/homepage_slider/df1aw_slide2.jpeg"
#   },
#   {
#     name: "Boston",
#     image: "http://art.onetravelsource.com/uploads/8/CB6271D0-0A33-4CCD-98775E640E9612B5.jpg"
#   },
#   {
#     name: "San Diego",
#     image: "http://www.sandiego.com/sites/sandiego.com/files/styles/gallery_listing_full/public/content/gallery/images/pacific_beach_wind_surfers.jpg?itok=T4zsdl1k"
#   },
#   {
#     name: "New York",
#     image: "https://pcavote.files.wordpress.com/2014/07/empire-state.jpg"
#   }
# ]
#
# p Post.create(POSTS)
# p User.create(USERS)
# p City.create(CITIES)
#



require 'ffaker'

puts "Seeding Database!"

User.destroy_all
City.destroy_all
Post.destroy_all

user_data = []

10.times do
  user_data << {
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    email: FFaker::Internet.safe_email,
    current_city: FFaker::Address.city,
    password: "test",
    image_url: "https://i.imgur.com/ixpF82Y.png"
  }
end

u = User.create(user_data) # array of all created users
puts "Seeded #{u.count} users."

puts "-----------"

admin = User.create({
  first_name: "admin",
  last_name: "admin",
  email: "admin@test.com",
  current_city: "Testico",
  password: "admin",
  image_url: "https://i.imgur.com/ixpF82Y.png"
})

puts "Seeded the admin account with id #{admin.id}."

puts "-----------"

City.create({
  name: "San Francisco",
  image: "http://cats2010.com/wp-content/uploads/2014/09/Untitled_Panorama4-2.jpg "
})
City.create({
  name: "London",
  image: "https://media.licdn.com/mpr/mpr/p/4/005/06e/30b/3b8b905.jpg"
})
City.create({
  name: "Gibraltar",
  image: "http://www.visitgibraltar.gi/images/homepage_slider/df1aw_slide2.jpeg"
})
City.create({
  name: "Boston",
  image: "http://art.onetravelsource.com/uploads/8/CB6271D0-0A33-4CCD-98775E640E9612B5.jpg"
})
City.create({
  name: "San Diego",
  image: "http://www.sandiego.com/sites/sandiego.com/files/styles/gallery_listing_full/public/content/gallery/images/pacific_beach_wind_surfers.jpg?itok=T4zsdl1k"
})
City.create({
  name: "New York",
  image: "https://pcavote.files.wordpress.com/2014/07/empire-state.jpg"
})


cities = City.all

puts "Seeded #{cities.count} cities."

puts "-----------"

cities.each do |city|
  12.times do
    city.posts.push(
    Post.create({
      title: city.name + "'s " + FFaker::CheesyLingo.title,
      content: "In #{city.name}, " + FFaker::CheesyLingo.sentence,
      user_id: rand(1..10),
      city_id: rand(1..6)
    })
    )
  end
end

puts "All of the cities have 12 starter posts. Seeding done!"
