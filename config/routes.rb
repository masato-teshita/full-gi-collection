Rails.application.routes.draw do
  get 'histories/index'

  devise_for :users
  root "tops#index"
  namespace :shops do
    resources :searches, only: [:index]
  end
  namespace :woms do
    resources :searches, only: [:index]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resources :woms, only: [:index, :new, :create, :show]
    resources :shops, only: [:index]
    resources :histories, only: [:index, :create]
  end
  resources :shops, only: [:index, :show, :new, :create] do
    resources :woms
  end
  resources :areas
  resources :genres
  resources :brands
  
end
