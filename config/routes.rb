Rails.application.routes.draw do

  resources :course_registrations
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
  get 'admin/courses'

  resources :blogs

  resources :subcategories

  resources :resources

  resources :subscribers

  resources :contacts
  post "contacts/:id/archive_contact" => "contacts#archive_contact", as: "archive_contact"
  post "contacts/:id/unarchive_contact" => "contacts#unarchive_contact", as: "unarchive_contact"

  resources :lessons
  resources :course_modules
  resources :courses

  post "lesson_completion/:id/complete_lesson" => "lesson_completion#complete_lesson", as: "complete_lesson"
  post "lesson_completion/:id/uncomplete_lesson" => "lesson_completion#uncomplete_lesson", as: "uncomplete_lesson"
  post "lesson_completion/:id/favorite_lesson" => "lesson_completion#favorite_lesson", as: "favorite_lesson"
  post "lesson_completion/:id/unfavorite_lesson" => "lesson_completion#unfavorite_lesson", as: "unfavorite_lesson"

end
