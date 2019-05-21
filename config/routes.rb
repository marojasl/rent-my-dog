Rails.application.routes.draw do
  get 'messages/create'
  get 'chatrooms/create'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show
  resources :dogs do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :destroy]
  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
