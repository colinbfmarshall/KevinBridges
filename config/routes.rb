Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts
  resources :profiles
  resources :tags, except: :show
  get 'tags/:tag', to: 'posts#index'
end
