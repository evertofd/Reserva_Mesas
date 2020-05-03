Rails.application.routes.draw do

  resources :posts

  resources :contacts
  #get 'home/index'

  #resources :reservations
  #  get 'reservationtables/index'


  #  get 'reservation/:space' => 'reservations#hola', as: 'route_hola'

  get 'reservations/:type/new' => 'reservations#new', as: 'new_reservation'
  get 'reservations/bookings', to: 'reservations#bookings'
  get 'access/dashboard', to: 'access#dashboard'
  get 'menu/bebidas', to: 'menu#bebidas'
  get 'menu/comida', to: 'menu#comida'
  patch 'access/:id', to: 'access#type_rol', as: 'type_rol'
  delete 'access/:id', to: 'access#destroy', as: 'destroy_user'

  
  resources :reservations do
    collection do
    end
  end
  resources :tables
  #get 'spaces/index'
  resources :home, only: :index
  resources :menu, only: :index

  resources :spaces, only: :index
  root to: 'home#index'



  devise_for :users, :controllers => { :sessions => 'users/sessions', :omniauth_callbacks => 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
