Rails.application.routes.draw do
  root "pages#home"
  get "about", to:"pages#about"
  # This line will give all the routes of 'articles'
  resources :articles, only: [:show,:index,:new,:create,:edit,:update]
end
