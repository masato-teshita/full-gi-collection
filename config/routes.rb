Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :shops, only: [:index, :show] do
    collection do
      get 'search'
    end
  end
end
