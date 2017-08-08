Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update]
  resource  :sessions,  only: [:create, :destroy]
end
