Rails.application.routes.draw do
  root to: "home#index"

  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }

  devise_scope :admin_user do
    get '/admin_users/sign_out' => 'admin_users/sessions#destroy'
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end

  resources :fortunes, only: [:create]
  resources :prizes do
    get '/exchange' => 'prizes#exchange'
    post '/exchange' => 'prizes#create_exchange'
  end

  namespace :admin do
    get "/" => "home#index"
    resources :prizes
    resources :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, format: 'json' do
    namespace :v1 do
      get '/fortunes/:page' => 'fortunes#index'
    end
  end
end
