Rails.application.routes.draw do
  get 'readies/show'

  devise_for :users, controllers: {
    registrations: 'devise/registrations',
  }
  
  def devise_scope(scope)
    constraint = lambda do |request|
      request.env["devise.mapping"] = Devise.mappings[scope]
      true
    end

    constraints(constraint) do
      yield
    end
  end

  root "tops#index"
  namespace :shops do
    get 'search'
  end
  namespace :woms do
    resources :searches, only: [:index]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resources :woms, only: [:index, :new, :create, :show]
    resources :shops, only: [:index]
    resources :histories, only: [:index, :create]
    resources :clips, only: [:index, :create, :destroy]
  end
  resources :shops do
    resources :woms
    resources :items do
      collection { post :import }
    end
    get 'map', to: 'shops#map'
  end
  resources :areas, only: :index
  resources :genres, only: :index
  resources :brands, only: :index
  resources :readies, only: :index
end