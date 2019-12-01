# frozen_string_literal: true

Rails.application.routes.draw do

  constraints CanAccessAdmin do
    namespace :admin do
      mount Flipper::UI.app(Flipper) => '/flipper', as: 'flipper'
    end
  end

  devise_for :users,
             path: 'user',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           sign_up: 'user' },
             controllers: { registrations: 'users/registrations' }

  constraints CanUserRegister do
    devise_scope :user do
      get '/user/registration' => 'users/registrations#new'
      post '/user/registration' => 'users/registrations#create'
      put '/user/registration' => 'users/registrations#update'
      patch '/user/registration' => 'users/registrations#update'
      delete '/user/registration' => 'users/registrations#destroy'
    end
  end

  authenticate :user do
    resources :campaigns do
      resources :campaign_invites, only: %i[index create]
    end
    resources :characters
  end

  get '*path' => redirect('/') unless Rails.env.development?

  root to: 'home#index'
end
