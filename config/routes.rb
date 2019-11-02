Rails.application.routes.draw do
  devise_for :user, path: 'user',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           sign_up: 'user' },
             :skip => [:registration]

  devise_scope :user do
    get '/user/registration' => 'devise/registrations#new', as: 'new_user_registration'
    post '/user/registration' => 'devise/registrations#create'
    put '/user/registration' => 'devise/registrations#update'
    patch '/user/registration' => 'devise/registrations#update'
    delete '/user/registration' => 'devise/registrations#destroy'
  end

  authenticate :user do
    resources :campaigns
    resources :characters
  end

  root to: 'home#index'
end
