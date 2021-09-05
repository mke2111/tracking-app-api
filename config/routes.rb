Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[create index show]
  resources :measures, only: %i[create index show]
  resources :measurements, only: %i[create index show]

  get '/signin', to: 'sessions#signin'
  get '/error', to: 'sessions#error'

  root 'measures#index'
end
