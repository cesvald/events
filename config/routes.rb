Rails.application.routes.draw do
  
  resources :places
  resources :participations
  
  resources :events do
    resources :spaces, shallow: true
    resources :modalities, shallow: true
    resources :participants, shallow: true do
      resources :air_tickets, shallow: true
      resources :payments, shallow: true
      resources :stays, shallow: true
    end  
  end
  
  resources :bookings
  resources :beds
  resources :rooms
  resources :locations do
    collection do
      get 'calendar'
    end
  end
  resources :houses
  resources :guests
  
  namespace :reports do
    resources :bookings, only: [:index] do
      collection do
        get 'monthly_guests'
      end
    end
  end
  
  devise_for :users, controllers: { sessions: "users/sessions" }
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'bookings#index'

end
