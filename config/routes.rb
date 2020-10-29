Rails.application.routes.draw do
  root 'customers#index'

  # Login
  post 'login', to: 'login#login'
  put 'logout', to: 'login#logout'

  # Customer
  get 'customers', to: 'customers#index'
  get 'customers/:id', to: 'customers#show'
  post 'customers', to: 'customers#create'
  put 'customers/:id', to: 'customers#update'
  delete 'customers/:id', to: 'customers#destroy'

  # Order
  get 'orders', to: 'orders#index'
  get 'orders/:id', to: 'orders#show'
  get 'orders/customer/:customer_id', to: 'orders#find_by_customer'
  post 'orders', to: 'orders#create'
  put 'orders/:id', to: 'orders#update'
  delete 'orders/:id', to: 'orders#destroy'
end
