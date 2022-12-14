Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'reset_password', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy', as: 'logout'
  end
  
  # root to: 'dashboard#redirect_user', as: 'root'
  root 'dashboard#index'
end
