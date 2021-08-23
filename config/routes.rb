Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      patch :publish
    end
  end

  root to: 'test_javascripts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/intersection_observers', to: 'test_javascripts#intersection_obs', as: 'intersection'
  get '/coming_soon', to: 'test_javascripts#coming_soon', as: 'coming_soon'
end
