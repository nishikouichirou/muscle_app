Rails.application.routes.draw do
  get 'instructors/new'

  get 'users/new'

  get 'sessions/new'

  root 'static_pages#home' # => root_path
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
end
