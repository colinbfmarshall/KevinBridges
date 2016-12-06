Rails.application.routes.draw do
  root 'posts#index'
  get 'welcome/index'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
    resources :comments, only: [:new, :create, :edit, :update, :destroy] do
      member do
        put "report", to: "comments#report"
      end
    end
  end 

  resources :profiles

  resources :tags, except: :show
  get 'tags/:tag', to: 'posts#index'
end