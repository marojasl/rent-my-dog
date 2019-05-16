Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :dogs
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
