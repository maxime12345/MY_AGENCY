Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :applications, only: [:index, :show, :edit, :update]
    resources :availabilities
  end
  resources :applications do
    resources :bookings
  end
  resources :profils, only: [:show, :edit, :update]
  resources :discussions, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
