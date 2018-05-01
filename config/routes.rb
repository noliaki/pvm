Rails.application.routes.draw do
  get 'home/index'

  get 'home/authentication'

  resources :fortune, only: [:create]

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  namespace :api, format: 'json' do
    namespace :v1 do
      get '/fortunes/:page' => 'fortunes#index'
    end
  end
end
