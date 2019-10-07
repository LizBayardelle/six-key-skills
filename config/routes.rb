Rails.application.routes.draw do

  resources :subscribers
  get 'home/index'
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  get 'users/show'
  get 'users/index'

  get 'admin/blogs'
  get 'admin/users'
  get 'admin/lead_magnets'

  resources :blogs
  resources :lead_magnets


end
