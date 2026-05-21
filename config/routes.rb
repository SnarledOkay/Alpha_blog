Rails.application.routes.draw do
  root "pages#home"
  get "about", to:"pages#about"
  resources :articles, :users
  get 'sign-up', to: 'users#new'
end


