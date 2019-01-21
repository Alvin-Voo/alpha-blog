Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'pages/home', to: 'pages#home'
  # get 'pages/about', to: 'pages#about'

  root 'pages#home'
  get 'about', to: 'pages#about'

  # this will provide all the CRUD routes, 
  resources :articles

  # overwrite the /user/new path to /signup
  get 'signup', to: 'users#new'
  resources :users, except: :new

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
