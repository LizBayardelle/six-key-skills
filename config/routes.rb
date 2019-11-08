Rails.application.routes.draw do

  resources :preauthorizations
  resources :subcategories
  get 'home/index'
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  get 'users/show'
  get 'users/index'
  post "users/:id/make_contributor" => "users#make_contributor", as: "make_contributor"


  get 'admin/blogs'
  get 'admin/users'
  get 'admin/resources'

  resources :blogs
  resources :resources
  resources :subscribers

end
