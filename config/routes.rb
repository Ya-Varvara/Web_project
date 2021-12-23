Rails.application.routes.draw do
  get 'session/login'
  get 'session/logout'
  get 'session/create'
  resources :recipes
  resources :users
  get 'cook_book/main_page'
  get 'cook_book/login'
  get 'cook_book/register'
  get 'cook_book/user_page'
  get 'cook_book/cook_page'
  root to: 'cook_book#main_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
