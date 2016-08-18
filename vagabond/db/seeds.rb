Post.delete_all

hash = [
  {
    title: "The best burrito in SF",
    content: "El Faralito has the best burritos in SF. They're open late and they taste wonderful.",
    image: "http://winstonwanders.com/wp-content/uploads/2014/11/DSC_5524_edit-700x393.jpg",
    user_id: 3
  },
  {
    title: "The best ice cream in SF",
    content: "Bi-Rite ice cream is the best",
    image: "https://mynikoneatsfood.files.wordpress.com/2011/02/dsc_7337.jpg",
    user_id: 3

  },
  {
    title: "The best sandwich place in SF",
    content: "Ikes sandwiches are the best",
    image: "http://cdn.funcheap.com/wp-content/uploads/2011/11/ikes-sandwich.jpg",
    user_id: 3
  }
]

p Post.create(hash)
