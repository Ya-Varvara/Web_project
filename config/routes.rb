Rails.application.routes.draw do
  get 'session/login'
  get 'session/logout'
  post 'session/create'
  resources :recipes
  resources :users
  get 'cook_book/main_page'
  root to: 'cook_book#main_page'

  get '/:locale' => 'cook_book#main_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
