
POSTS = [
  {
    title: "If You're Visiting San Francisco, You Have To Get THIS BURRITO.",
    content: "El Faralito has the best burritos in SF, HANDS DOWN. Sure you have to wait in a long line, but it's worth the wait. Bonus: they are open crazy late for those times when all you need is a burrito after a great rock concert.",
    image: "http://winstonwanders.com/wp-content/uploads/2014/11/DSC_5524_edit-700x393.jpg",
    user_id: 1,
    city_id: 1
  },
  {
    title: "There Are a Thousand Ice Cream Shops in SF... but Only One Bi-Rite!!!",
    content: "Bi-rite ice cream will change the way you think about Ice Cream. If you're traveling through SF, take a minute to experience ice cream the way ice cream was always meant to be: simple and delicious.",
    image: "https://mynikoneatsfood.files.wordpress.com/2011/02/dsc_7337.jpg",
    user_id: 1,
    city_id: 1
  },
  {
    title: "Two Words: Pug. Woodstock.",
    content: "On the first Sunday of every month at Alta Plaza Park, something magical happens. Pug Woodstock. Everyone in the area brings their pugs in for a giant sea of pugs. A pug sea. HOW CAN YOU RESIST?",
    image: "http://s3-media1.fl.yelpcdn.com/bphoto/CKabJysnNNF33cKjaAWKtQ/348s.jpg",
    user_id: 1,
    city_id: 1
  }
]

USERS = [
  {
    first_name: "Kathleen",
    last_name: "Hanna",
    email: "khanna@test.com",
    current_city: "San Francisco",
    password_digest: "$2a$10$Dnb1rMCPOFcQfSKDPdVXY.G.xkWyTus6liF3q5Q1.fB/AAIQgSZFu",
    image_url: "http://assets.rollingstone.com/assets/images/story/kathleen-hanna-moves-forward-with-the-julie-ruin-20130904/hanna-306-1378408387.jpg"
  },
  # {
  #   first_name: "Frank",
  #   last_name: "Ocean",
  #   email: "focean@test.com",
  #   current_city: "New Orleans",
  #   password_digest:""
  #   image_url: "http://cdn.pitchfork.com/tracks/17293/homepage_large.8a0c1ce3.jpg"
  # },
  # {
  #   first_name: "Ada",
  #   last_name: "Lovelace",
  #   email:"alovelace@test.com",
  #   current_city: "London",
  #   password_digest:""
  #   image_url: "http://i.imgur.com/ixpF82Y.png"
  # }
]

CITIES = [
  {
    name: "San Francisco",
    image: "http://cats2010.com/wp-content/uploads/2014/09/Untitled_Panorama4-2.jpg "
  },
  {
    name: "London",
    image: "https://media.licdn.com/mpr/mpr/p/4/005/06e/30b/3b8b905.jpg"
  },
  {
    name: "Gibraltar",
    image: "http://www.visitgibraltar.gi/images/homepage_slider/df1aw_slide2.jpeg"
  },
  {
    name: "Boston",
    image: "http://art.onetravelsource.com/uploads/8/CB6271D0-0A33-4CCD-98775E640E9612B5.jpg"
  },
  {
    name: "San Diego",
    image: "http://www.sandiego.com/sites/sandiego.com/files/styles/gallery_listing_full/public/content/gallery/images/pacific_beach_wind_surfers.jpg?itok=T4zsdl1k"
  },
  {
    name: "New York",
    image: "https://pcavote.files.wordpress.com/2014/07/empire-state.jpg"
  }
]

p Post.create(POSTS)
p User.create(USERS)
p City.create(CITIES)
