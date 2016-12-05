Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end 

  resources :profiles
  resources :tags, except: :show
  get 'tags/:tag', to: 'posts#index'
end