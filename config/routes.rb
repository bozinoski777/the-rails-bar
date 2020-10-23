Rails.application.routes.draw do
  root to: 'pages#home'
  resources :cocktails do
    resources :doses
    resources :ratings
  end
  resources :doses, only: [:destroy]
  resources :cocktails, only: [:destroy]
  # get '/cocktails', to: 'cocktail#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
