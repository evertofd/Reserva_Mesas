# Rails.application.routes.draw do


# #  get 'reservationtables/index'
#
#
# #  get 'reservation/:space' => 'reservations#hola', as: 'route_hola'
#
# get 'reservations/:type/new' => 'reservations#new', as: 'new_reservation'
#
#
#   resources :reservations do
#     collection do
#     end
#   end
#   resources :tables
#   #get 'spaces/index'
#
#   resources :spaces, only: :index
#   root to: 'spaces#index'
#   devise_for :users
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do

  #resources :reservations
#  get 'reservationtables/index'


#  get 'reservation/:space' => 'reservations#hola', as: 'route_hola'

get 'reservations/:type/new' => 'reservations#new', as: 'new_reservation'


  
  resources :reservations do
    collection do
    end
  end
  resources :tables
  #get 'spaces/index'

  resources :spaces, only: :index
  root to: 'spaces#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
