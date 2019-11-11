Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  get 'users/show'
  get 'users/index'
  post "users/:id/make_contributor" => "users#make_contributor", as: "make_contributor"
  resources :preauthorizations


  get 'admin/blogs'
  get 'admin/users'
  get 'admin/resources'

  resources :blogs

  resources :subcategories

  resources :resources

  resources :subscribers

  resources :contacts
  post "contacts/:id/archive_contact" => "contacts#archive_contact", as: "archive_contact"


end
