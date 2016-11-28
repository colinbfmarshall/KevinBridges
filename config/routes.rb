Rails.application.routes.draw do
  resources :profiles
  root 'welcome#index'
  get 'welcome/index'
  
  devise_for :users, controllers: { registrations: "registrations" }
  resources :posts
end
