Rails.application.routes.draw do
  root to: "home#index"

  devise_for :admin_users
  devise_scope :admin_user do
    get '/admin_users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :fortune, only: [:create]
  resources :prize, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, format: 'json' do
    namespace :v1 do
      get '/fortunes/:page' => 'fortunes#index'
    end
  end
end
