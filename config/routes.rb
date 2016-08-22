Rails.application.routes.draw do

  root to: "users#splash"

  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/login", to: "sessions#new", as: "new_session"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"

  get "/cities/:id", to: "cities#show", as: "city"

  get "/posts/new", to: "posts#new", as: "new_post"
  post "/cities/:city_id/posts", to: "city#create", as: "new_city_post"
  get "/posts/:post_id", to: "posts#show", as: "post"
  get "/posts/:post_id/edit", to: "posts#edit", as: "edit_post"
  patch "/posts/:post_id", to: "posts#update", as: "update_post"
  delete "/posts/:post_id", to: "posts#destroy"

  get "*unmatched_route", to: "application#not_found"
end
