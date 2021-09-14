Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[create show]
  resources :sessions, only: %i[create show]
  resources :tasks, only: %i[create]

  post '/login', to: 'auth#login'

  get 'auto_login', to: 'auth#auto_login'

  get '/longest/:id', to: 'sessions#longest'
  get '/latest/:id', to: 'sessions#latest'
  get '/top/:id', to: 'tasks#top'
end
