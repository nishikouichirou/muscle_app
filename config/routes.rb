Rails.application.routes.draw do
  

  get 'chatrooms/new'

  root 'static_pages#home'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get  '/instructors_signup',  to: 'instructors#new'
  post '/instructors_signup',  to: 'instructors#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  
  delete '/logout',  to: 'sessions#destroy'
  delete '/instructors_logout',  to: 'sessions#instructor_destroy'
  
  resources :users
  resources :instructors
end
