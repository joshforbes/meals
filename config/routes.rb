Rails.application.routes.draw do
  resources :meals
  resources :recipes
  resources :users, only: [:show, :create, :update]
  resource  :sessions,  only: [:create, :destroy]
end
