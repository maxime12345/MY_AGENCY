Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :candidacies, only: [:index, :new, :show, :edit, :update]
    resources :availabilities
  end
  resources :candidacies do
    resources :bookings
    resources :messages, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :profils, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
