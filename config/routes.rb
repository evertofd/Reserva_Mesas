Rails.application.routes.draw do
#  get 'reservationtables/index'


#  get 'reservation/:space' => 'reservations#hola', as: 'route_hola'

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
