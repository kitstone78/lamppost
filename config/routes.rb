Rails.application.routes.draw do
  resources :messages

  #Error when trying the get users line so went back to resources :users
  resources :users
  #get '/users' => 'users#index'

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  namespace :admin do
    resources :users
    resources :messages
    get '/login' => 'logins#new', as: 'logins'
    post 'login' => 'logins#create'
    delete '/login' => 'logins#destroy'
  end
end
