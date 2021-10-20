Rails.application.routes.draw do
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
  post 'callback/index' => 'callback#received_data'
  get 'callback/received_data'
  # root to: 'callback#index'


  mount Facebook::Messenger::Server, at: "bot"

  root to: 'test_javascripts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/intersection_observers', to: 'test_javascripts#intersection_obs', as: 'intersection'
  get '/coming_soon', to: 'test_javascripts#coming_soon', as: 'coming_soon'
end
