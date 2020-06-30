Rails.application.routes.draw do

  get 'session/home'
  root "session#home"
  resources :items
  resources :orders
  resources :users
  resources :order_items

  get 'users/:id/orders', to: 'users#order_index'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'

  delete '/logout', to: 'session#destroy'

  # GOOGLE Login
  get '/auth/google_oauth2/callback', to: 'session#oauth_login'
  # FACEBOOK LOGIN
  get '/auth/facebook/callback' => 'session#oauth_login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
