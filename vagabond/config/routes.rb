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
  post "/cities/:id", to: "posts#create"
  get "posts/:id", to: "posts#show", as: "post"
end
