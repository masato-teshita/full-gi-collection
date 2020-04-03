Rails.application.routes.draw do
  get 'readies/show'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/thanks' => 'users/registrations#thanks'
  end
  
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
    resources :searches, only: [:index]
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
  resources :shops, only: [:index, :show, :new, :create] do
    resources :woms
  end
  resources :areas
  resources :genres
  resources :brands
  resources :readies, only: :index
end
