Rails.application.routes.draw do
  devise_for :user, path: 'account',
                    path_names: { sign_in: 'login',
                                  sign_out: 'logout',
                                  sign_up: 'register' }

  authenticated do
    root to: redirect('campaigns'), as: :authenticated
    resources :campaigns
  end

  root to: 'home#index'
end
