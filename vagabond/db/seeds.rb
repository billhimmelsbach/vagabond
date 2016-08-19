Post.delete_all

POSTS = [
  {
    title: "The best burrito in SF",
    content: "El Faralito has the best burritos in SF. They're open late and they taste wonderful.",
    image: "http://winstonwanders.com/wp-content/uploads/2014/11/DSC_5524_edit-700x393.jpg",
    user_id: 1,
    city_id: 1
  },
  {
    title: "The best ice cream in SF",
    content: "Bi-Rite ice cream is the best",
    image: "https://mynikoneatsfood.files.wordpress.com/2011/02/dsc_7337.jpg",
    user_id: 1,
    city_id: 1

  },
  {
    title: "The best sandwich place in SF",
    content: "Ikes sandwiches are the best",
    image: "http://cdn.funcheap.com/wp-content/uploads/2011/11/ikes-sandwich.jpg",
    user_id: 2,
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
  }
]

CITY = [
  {
    name: "San Francisco",
    image: "http://cats2010.com/wp-content/uploads/2014/09/Untitled_Panorama4-2.jpg "
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
  },

]

p Post.create(POSTS)
p User.create(USERS)
p City.create(CITY)
