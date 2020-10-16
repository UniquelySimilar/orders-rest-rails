Rails.application.routes.draw do
  root 'customers#index'
  
  get 'customers', to: 'customers#index'
  get 'customers/:id', to: 'customers#show'
  post 'customers', to: 'customers#create'
  put 'customers/:id', to: 'customers#update'
  delete 'customers/:id', to: 'customers#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
