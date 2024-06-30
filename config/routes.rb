Rails.application.routes.draw do
  
  devise_for :users,
  path: '',
  path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
  controllers: {registrations: 'registrations'}

  get 'users/dashboard'
  root 'pages#home'

  get '/dashboard', to: 'users#dashboard'
  get 'pages/home'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'


  post '/users/edit', to: 'users#update'

  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
      get 'people'
      get 'preload'
      get 'preview'
      delete :delete_photo
      post :upload_photo
    end
    resources :reservations, only: [:create]
  end

  resources :guest_reviews, only: [:create, :destroy]
  resources :host_reviews, only: [:create, :destroy]

  resources :reservations, only: [:approve, :decline] do
    member do
      post '/approve' => "reservations#approve"
    end
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end