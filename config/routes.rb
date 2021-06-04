Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: "plans#index"
  resources :plans
end
