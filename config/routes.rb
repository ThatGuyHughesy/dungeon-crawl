Rails.application.routes.draw do
  devise_for :user, path: 'account',
                    path_names: { sign_in: 'login',
                                  sign_out: 'logout',
                                  sign_up: 'register' }

  authenticate :user do
    resources :campaigns
    resources :characters
  end

  root to: 'home#index'
end
