Rails.application.routes.draw do
  
  get 'users/dashboard'
  root 'pages#home'

  get 'pages/home'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show', as: 'user'

  post '/users/edit', to: 'users#update'

  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
      delete :delete_photo
      post :upload_photo
    end
  end

  devise_for :users,
  path: '',
  path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
  controllers: {registrations: 'registrations'}
  
  get "up" => "rails/health#show", as: :rails_health_check

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end