Rails.application.routes.draw do
  root 'customers#index'

  # Customer routes
  get 'customers', to: 'customers#index'
  get 'customers/:id', to: 'customers#show'
  post 'customers', to: 'customers#create'
  put 'customers/:id', to: 'customers#update'
  delete 'customers/:id', to: 'customers#destroy'

  # Order routes
  get 'orders', to: 'orders#index'
  get 'orders/:id', to: 'orders#show'
  post 'orders', to: 'orders#create'
  put 'orders/:id', to: 'orders#update'
  delete 'orders/:id', to: 'orders#destroy'
end
