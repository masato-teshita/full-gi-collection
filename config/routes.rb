Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  namespace :shops do
    resources :searches, only: [:index]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resources :woms, only: [:index, :new, :create, :show]
    resources :shops, only: [:index]
  end
  resources :shops, only: [:index, :show, :new, :create] do
    resources :woms, only: [:index, :create]
  end
  resources :areas
  resources :genres
  resources :brands
end
