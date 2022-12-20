Rails.application.routes.draw do
  resources :tasks, path: :tasks
  resources :projects
  resources :boards
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'reset_password', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy', as: 'logout'
  end
  
  # root to: 'dashboard#redirect_user', as: 'root'
  root 'dashboard#index'
  post 'create_task', to: 'tasks#create_task', as: 'create_task'
  post 'update_task/(:task_token)', to: 'tasks#update_task', as: 'update_task'
  post 'delist_task/(:task_token)', to: 'tasks#delist_task', as: 'delist_task'
  get 'task_detail/(:task_token)', to: 'tasks#task_detail', as: 'task_detail'
end
