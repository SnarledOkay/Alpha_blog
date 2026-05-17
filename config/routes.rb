Rails.application.routes.draw do
  root "pages#home"
  get "about", to:"pages#about"
  # This line will give all the routes of 'articles'

  #At this point, we already have all the REST-ful routes for 'articles'
  # resources :articles, only: [:show,:index,:new,:create,:edit,:update,:destroy]
  resources :articles
end
