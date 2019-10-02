Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]

  get 'home/index'
  root 'home#index'

end
