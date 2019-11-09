Rails.application.routes.draw do
  constraints CanAccessAdmin do
    namespace :admin do
      mount Flipper::UI.app(Flipper) => '/flipper', as: 'flipper'
    end
  end

  devise_for :user, path: 'user',
                    path_names: { sign_in: 'login',
                                  sign_out: 'logout',
                                  sign_up: 'user' },
                    skip: [:registration]

  constraints CanUserRegister do
    devise_scope :user do
      get '/user/registration' => 'devise/registrations#new', as: 'new_user_registration'
      post '/user/registration' => 'devise/registrations#create'
      put '/user/registration' => 'devise/registrations#update'
      patch '/user/registration' => 'devise/registrations#update'
      delete '/user/registration' => 'devise/registrations#destroy'
    end
  end

  authenticate :user do
    resources :campaigns
    resources :characters
  end

  get '*path' => redirect('/') unless Rails.env.development?

  root to: 'home#index'
end
