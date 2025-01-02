Rails.application.routes.draw do
  
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  resources :places
  resources :users, except: :show do
    collection do
      post :recreate
    end
    member do
      get :reset_password
    end
  end
  
  resources :change_logs
  resources :participants, only: :index
  
  resources :events do
    member do
      get :new_import
      post :import
      get :report_detail
      get :report_general
      get :report_composition
      get :report_payment_methods
      post :duplicate
    end
    resources :modalities do
      member do
        get :admin_modalities
        post :assign_modality
        get :remove_modality
      end
    end
    resources :places do
      member do
        get :remove
        get :assign
      end
    end
    resources :participants do
      member do
        get :next_deposit_state
      end
      collection do
        get 'send_suscription_mail'
      end
      resources :air_tickets
      resources :payments
      resources :stays
    end
  end
  
  resources :bookings do
    member do
      get :next_deposit_state
    end
    resources :payments
  end
  
  resources :beds
  resources :rooms
  resources :locations do
    collection do
      get 'calendar'
    end
  end
  resources :houses
  resources :guests do
    member do
      get 'auto_edit'
      post 'auto_update'
    end
    collection do
      get 'not_access_allowed'
      get 'auto_update_success'
    end
  end
  
  namespace :reports do
    resources :bookings, only: [:index] do
      collection do
        get 'monthly_guests'
      end
    end
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'bookings#index'

end
