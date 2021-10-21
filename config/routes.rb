require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'test_javascripts#index'
  
  resources :meetings do
    resources :comments
  end
  resources :fb_messages
  resources :channel_users
  resources :channels
  devise_for :users
  
  resources :posts do
    resource :like, module: 'posts'
    
    member do
      patch :publish
    end
  end

  get 'callback/index'
  post '/callback/receive', to: 'callback#received_data'
  get 'callback/received_data'
  # root to: 'callback#index'


  mount Facebook::Messenger::Server, at: "bot"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/intersection_observers', to: 'test_javascripts#intersection_obs', as: 'intersection'
  get '/coming_soon', to: 'test_javascripts#coming_soon', as: 'coming_soon'
end
