Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :candidacies, only: [:index, :new, :show, :edit, :update] do
      resources :messages, only: [:index, :new, :create]
    end
    resources :availabilities
    resources :messages
    collection do
      get :extract_from_lbc
    end
  end
  resources :candidacies do
    resources :bookings
    resources :messages, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :profils, only: [:show, :edit, :update]
  resources :bookings, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
