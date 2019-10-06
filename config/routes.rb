Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  get 'users/show'
  get 'users/index'

  get 'admin/blogs'
  get 'admin/users'

  resources :blogs
  resources :lead_magnets
  

end
