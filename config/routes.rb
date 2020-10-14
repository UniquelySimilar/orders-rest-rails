Rails.application.routes.draw do
  root 'customers#index'
  
  get '/customers', to: 'customers#index'
  get 'customers/create'
  get 'customers/show'
  get 'customers/update'
  get 'customers/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
